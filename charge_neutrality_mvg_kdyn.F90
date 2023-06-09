module charge_neutrality

  use shr_kind_mod, only : r8 => shr_kind_r8
  use cam_logfile,  only : iulog
  use ppgrid,       only : pcols, pver
  use mo_chem_utls, only : get_spc_ndx
  use chem_mods,    only : gas_pcnst

  implicit none

  private
  public :: charge_balance

  interface charge_balance
     module procedure charge_fix_vmr
     module procedure charge_fix_mmr   ! for fixing charge balance after vertical diffusion
  end interface

!WUHU FENG,John Plane , 18/09/2018  
! integer, parameter :: pos_ion_n = 20
  integer, parameter :: pos_ion_n = 29
  character(len=16), parameter :: pos_ion_names(pos_ion_n) = (/ &
       'Np              ','N2p             ','Op              ','O2p             ','NOp             ', &
       'O4p             ','O2p_H2O         ','Hp_H2O          ','Hp_2H2O         ','Hp_3H2O         ', &
       'Hp_4H2O         ','Hp_5H2O         ','H3Op_OH         ','Hp_3N1          ','Hp_4N1          ', &
       'NOp_H2O         ','NOp_2H2O        ','NOp_3H2O        ','NOp_CO2         ','NOp_N2          ', &
!WUHU FENG,John Plane 
       'Nap             ','NaOp            ','NaN2p           ','NaCO2p          ','NaH2Op          ', &
       'Fep             ','FeOp            ','FeO2p           ','FeN2p           '                  /) 
!WUHU FENG,John Plane

  integer, parameter :: neg_ion_n = 21
  character(len=16), parameter :: neg_ion_names(neg_ion_n) = (/ &
       'Om              ','O2m             ','O3m             ','O4m             ','OHm             ', &
       'CO3m            ','CO4m            ','NO2m            ','NO3m            ','HCO3m           ', &
       'CLm             ','CLOm            ','CLm_H2O         ','CLm_HCL         ','CO3m_H2O        ', &
       'NO3m_H2O        ','CO3m2H2O        ','NO2m_H2O        ','NO3m2H2O        ','NO3mHNO3        ', &
       'NO3m_HCL        ' /)

contains

  !-----------------------------------------------------------------------      
  !        ... force ion/electron balance
  !-----------------------------------------------------------------------      
  subroutine charge_fix_vmr( ncol, vmr )

    !-----------------------------------------------------------------------      
    !        ... dummy arguments
    !-----------------------------------------------------------------------      
    integer,  intent(in)    :: ncol
    real(r8), intent(inout) :: vmr(:,:,:)         ! concentration

    !-----------------------------------------------------------------------      
    !        ... local variables
    !-----------------------------------------------------------------------      
    integer  :: i, k, n
    integer  :: elec_ndx
    real(r8) :: wrk(ncol,pver)

    elec_ndx = get_spc_ndx('e')

    !--------------------------------------------------------------------
    ! If electrons are in the chemistry add up charges to get electrons
    !--------------------------------------------------------------------  
    if( elec_ndx > 0 ) then
       wrk(:,:) = 0._r8

       do i = 1,pos_ion_n
          n = get_spc_ndx(pos_ion_names(i))
          if (n>0) then
             wrk(:ncol,:) = wrk(:ncol,:) + vmr(:ncol,:,n)
          endif
       enddo
       do i = 1,neg_ion_n
          n = get_spc_ndx(neg_ion_names(i))
          if (n>0) then 
             wrk(:ncol,:) = wrk(:ncol,:) - vmr(:ncol,:,n)
          endif
       enddo

       vmr(:ncol,:,elec_ndx) = max(0._r8,wrk(:ncol,:))
    end if

  end subroutine charge_fix_vmr

  !-----------------------------------------------------------------------
  !        ... force ion/electron balance
  !-----------------------------------------------------------------------
  subroutine charge_fix_mmr(state, pbuf)

    use constituents,        only : cnst_get_ind
    use physconst,           only : mbarv                       ! Constituent dependent mbar
    use short_lived_species, only : slvd_index,slvd_pbf_ndx => pbf_idx ! Routines to access short lived species in pbuf
    use chem_mods,           only : adv_mass
    use physics_buffer,      only : pbuf_get_field,physics_buffer_desc ! Needed to get variables from physics buffer
    use physics_types,       only : physics_state
    use infnan,              only : nan, assignment(=)

    !-----------------------------------------------------------------------      
    !        ... dummy arguments
    !-----------------------------------------------------------------------      
    type(physics_state), intent(inout), target :: state
    type(physics_buffer_desc), pointer :: pbuf(:)    ! physics buffer

    !-----------------------------------------------------------------------      
    !        ... local variables
    !-----------------------------------------------------------------------      
    integer  :: i, n, ns, nc
    integer  :: elec_ndx
    integer  :: lchnk                 !Chunk number from state structure
    integer  :: ncol                  !Number of columns in this chunk from state structure

    real(r8), dimension(:,:,:), pointer :: q         ! model mass mixing ratios
    real(r8), dimension(:,:),   pointer :: qs        ! Pointer to access fields in pbuf
    real(r8), dimension(:,:),   pointer :: mbar

    real(r8) :: vmr(pcols,pver,gas_pcnst)  
    character(len=16) :: name

    !-----------------------------------------------------------------------      
    elec_ndx = get_spc_ndx('e')

    !--------------------------------------------------------------------
    ! If electrons are simulated enforce charge neutrality ...
    !--------------------------------------------------------------------  
    if( elec_ndx > 0 ) then
       lchnk = state%lchnk
       ncol  = state%ncol
       q => state%q
       mbar => mbarv(:ncol,:,lchnk)
       vmr = nan

       do i = 1,pos_ion_n+neg_ion_n
          if (i .le. pos_ion_n) then
             name = pos_ion_names(i)
          else
             name = neg_ion_names(i-pos_ion_n)
          endif
          n = get_spc_ndx(name) 

          if (n>0) then
             call cnst_get_ind( name, nc, abort=.false. )
             if (nc>0) then
                vmr(:ncol,:,n) = mbar(:ncol,:) * q(:ncol,:,nc) / adv_mass(n)
             else
                ns = slvd_index( name )
                call pbuf_get_field(pbuf, slvd_pbf_ndx, qs, start=(/1,1,ns/), kount=(/pcols,pver,1/) )
                vmr(:ncol,:,n) = mbar(:ncol,:) * qs(:ncol,:) / adv_mass(n)
             endif
          endif
       enddo

       call charge_balance( ncol, vmr )

       call cnst_get_ind( 'e', nc, abort=.false. )  

       if (nc>0) then 
          q(:ncol,:,nc) = adv_mass(elec_ndx) * vmr(:ncol,:,elec_ndx) / mbar(:ncol,:)
       else
          ns = slvd_index( 'e' )
          call pbuf_get_field(pbuf, slvd_pbf_ndx, qs, start=(/1,1,ns/), kount=(/pcols,pver,1/) )
          qs(:ncol,:) = adv_mass(elec_ndx) * vmr(:ncol,:,elec_ndx) / mbar(:ncol,:)
       endif

    endif

  end subroutine charge_fix_mmr

end module charge_neutrality
