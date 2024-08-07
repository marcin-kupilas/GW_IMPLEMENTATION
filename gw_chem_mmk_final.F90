module gw_chem
!
! This module contains code to compute the diffusion of atmospheric constituents and background temperature
! due to the propagation of non-breaking gravity waves (Gardner et al, ESS, 2019; Gardner et al, JGR, 2018).
! Here we compute the effective wave diffusivity (K_wave) as a function of the eddy diffusivity (Kzz) and
! of the variance of the gw temperature perturbations. A new total dynamical diffusivity is defined (K_dyn)
! that accounts for both breaking and vertically propagating gravity waves.
! K_dyn is used instead of Kzz to diffuse both atmospheric constituents and background temperature.
!
! Author: Maria Vittoria Guarino 
!
! References:  Gardner et al, ESS, 2019; Guarino et al., 2023, in preparation. 
!
use gw_utils,     only: r8
use coords_1d,    only: Coords1D
use spmd_utils,   only: masterproc
use cam_logfile,  only: iulog
use ref_pres,     only: pref_edge
use time_manager, only: get_nstep
use physics_types, only: physics_state
use linear_1d_operators, only: TriDiagDecomp

implicit none
private
save

! Public interface.
public :: effective_gw_diffusivity

contains

!==========================================================================

subroutine effective_gw_diffusivity (ncol, band, lambda_h, p, dt, t, rhoi, nm, ni,        &
           c_speed, tau, egwdffi, ubi, q, dse, dttke, tend_level, vramp, k_wave,          &  
           k_wave_new, k_h_new, k_dyn_c, k_dyn_h, & !MMK
           kappa_tilde, k_m_m, k_h_m, k_h_m_waccm, & 
           kvtt, gw_prndl, lchnk, & ! MMK END
           k_e, zm, zi, var_t, k_dyn, dttdf, ttgw, qtgw, lat, lon, kwvrdg)
!-----------------------------------------------------------------------
! Call function to compute k_wave (wave effective diffusivity), k_e (wave energy flux) and 
! instability parameter (xi). Define a new total dynamical diffusivity (k_dyn) as a
! function of Kzz (egwdffi), k_wave and xi to solve the diffusion equation for 
! atmospheric constituents and background temperature. 
!-----------------------------------------------------------------------
!
! MMK: Now also compute kappa_tilde, psi_bar, k_wave_new and k_dyn_h for improved 
! parameterisation. 
! New total dynamical diffusivity k_dyn_c will be computed
! as a function of Kzz, (egwdffi), k_wave_new, xi, kappa_tilde and psi_bar.
! The diffusion equation for atmospheric constituents
! will be calculated using k_dyn_c.
! New thermal diffusivity, k_dyn_h, will be computed as a function of
! TODO ...
! The diffusion equation for temperature will be calculated using k_dyn_h
!
!-----------------------------------------------------------------------
use gw_common, only: GWBand, pver, pi
use physconst, only: cpair, cpairv, gravit
use gw_utils, only: midpoint_interp
use vdiff_lu_solver, only: fin_vol_lu_decomp
use gw_diffusion, only: gw_ediff, gw_diff_tend

!------------------------------Arguments--------------------------------
  ! Column dimension.
  integer, intent(in) :: ncol
  ! Integer chunk identifier for debugging
  integer, intent(in), optional :: lchnk ! MMK optional for debugging
  ! band of phase speeds c within which waves are emitted
  type(GWBand), intent(in) :: band
  ! horizontal wavelength
  real(r8), intent(in) :: lambda_h
  ! horizontal wavenumber [anisotropic orography]
  real(r8), intent(in), optional :: kwvrdg(ncol)
  ! Pressure coordinates
  type(Coords1D), intent(in) :: p
  ! Time step
  real(r8), intent(in) :: dt
  ! Midpoint temperature
  real(r8), intent(in) :: t(ncol,pver)
  ! Interface density (Kg m-3)
  real(r8), intent(in) :: rhoi(ncol,pver+1)
  ! Midpoint and interface Brunt-Vaisala frequencies
  real(r8), intent(in) :: nm(ncol,pver), ni(ncol,pver+1)
  ! Projection of wind at interfaces
  real(r8), intent(in) :: ubi(ncol,pver+1)
  ! Wave phase speeds for each column
  real(r8), intent(in) :: c_speed(ncol,-band%ngwv:band%ngwv)
  ! Wave Reynolds stress
  real(r8), intent(in) :: tau(ncol,-band%ngwv:band%ngwv,pver+1)
  ! Effective gravity wave diffusivity at interfaces
  real(r8), intent(in) :: egwdffi(ncol,pver+1)
  ! Midpoint and Interface altitudes above ground (m)
  real(r8), intent(in) :: zm(ncol,pver), zi(ncol,pver+1)    
  ! Latitude in radians
  real(r8), intent(in) :: lat(:)
  ! Longitude in radians
  real(r8), intent(in) :: lon(:)
  ! Lowest level where wind tendencies are calculated
  integer, intent(in) :: tend_level(ncol)
  ! Constituent array
  real(r8), intent(in) :: q(:,:,:)
  ! Dry static energy
  real(r8), intent(in) :: dse(ncol,pver)
  ! Coefficient to ramp down diffusion coeff
  real(r8), pointer, intent(in) :: vramp(:)
  ! Temperature tendencies from  kinetic energy
  real(r8), intent(in) :: dttke(ncol,pver)
  ! Gravity wave heating tendency.
  real(r8), intent(out) :: ttgw(ncol,pver)   	     
  ! Gravity wave constituent tendency.
  real(r8), intent(out) :: qtgw(:,:,:)	    
  ! Temperature tendencies from diffusion 
  real(r8), intent(out) :: dttdf(ncol,pver)  
 
  ! Total dynamical diffusivity
  real(r8), intent(out) :: k_dyn(ncol,pver+1)
  ! Effective wave diffusivity k_wave (over entire wave spectrum for each GW source)
  real(r8), intent(out) :: k_wave(ncol,pver)
  ! Wave energy flux
  real(r8), intent(out) :: k_e(ncol,pver)
  ! Variance of gw temperature perturbations
  real(r8), intent(out) :: var_t(ncol,pver)
  ! Instability parameter
  real(r8) :: xi(ncol,pver)      

  ! MMK Arguments
  ! Gw Prandtl Number
  real(r8), intent(in) :: gw_prndl
  ! WACCM "Molecular Thermal Diffusivity"
  real(r8), intent(in) :: kvtt(ncol,pver+1)
  ! New effective wave diffusivity k_wave_new
  real(r8), intent(out) :: k_wave_new(ncol, pver)
  ! New thermal diffusivity k_h_new
  real(r8), intent(out) :: k_h_new(ncol, pver)
  ! New total constituent diffusivity 
  real(r8), intent(out) :: k_dyn_c(ncol, pver+1)
  ! New total thermal diffusivity 
  real(r8), intent(out) :: k_dyn_h(ncol, pver+1)
  ! Kappa tilde - no official name
  real(r8), intent(out) :: kappa_tilde(ncol, pver)
  ! Molecular kinematic viscosity
  real(r8), intent(out) :: k_m_m(ncol, pver+1)
  ! Molecular diffusivity for heat
  real(r8), intent(out) :: k_h_m(ncol, pver+1)
  ! Molecular diffusivity of heat WACCM for testing
  real(r8), intent(out) :: k_h_m_waccm(ncol, pver+1) ! = gw_prndl*kvtt in compute_kwave

  !---------------------------Local storage-------------------------------

  ! Level, wavenumber, and column loop indices
  integer  :: k, l, i, m_q
  ! Bottom level for computation of k_wave
  integer  :: kwave_level 
  ! Gas consant for dry air (m2 K-1 s-2)
  real(r8), parameter :: R_air = 287._r8
  ! Adiabatic lapse rate and cp/R ratio
  real(r8) :: gamma_ad, cp_r 
  ! Interface temperature.
  real(r8) :: ti(ncol,pver+1)
  ! The absolute momenum flux computed from tau
  real(r8) :: mom_flux(ncol,-band%ngwv:band%ngwv,pver+1)
  ! Wave Reynolds stress damped.
  real(r8) :: tau_dmp(ncol,-band%ngwv:band%ngwv,pver+1)
  ! Damping factor for tau profile
  real(r8) :: lambda_wave(ncol,-band%ngwv:band%ngwv,pver)
  ! GW intrinsic frequency 
  real(r8) :: gw_frq(ncol,-band%ngwv:band%ngwv,pver+1) 
  ! Vertical wavenumber m
  real(r8) :: m(ncol,-band%ngwv:band%ngwv,pver+1) 
  ! GW intrinsic phase speed
  real(r8):: c_i(ncol,-band%ngwv:band%ngwv,pver+1)
  ! GW temperature perturbation
  real(r8):: gw_t(ncol,-band%ngwv:band%ngwv,pver+1)
  ! Delta z computed across interfaces 
  real(r8) :: delta_z(ncol, pver+1)
  ! Convert degrees to radians
  real(r8), parameter :: degree_radian = pi/180._r8
  ! Convert hours to seconds
  real(r8), parameter :: hr_sec = 3600._r8
  ! Coriolis frequency and inertial period
  real(r8) :: coriolis_f(size(lat)), inertial_prd(size(lat))
  ! Interface Brunt-Vaisala frequency N, and N^2, computed locally
  real(r8) :: brnt_v(ncol,pver), brnt_v_sq(ncol,pver)
  ! Min value for squared Brunt_vaisala frequency
  real(r8), parameter :: brnt_v_sq_min = 5.e-5_r8
  ! dT/dz environment
  real(r8) :: dtdz(ncol, pver)
  ! Environmental lapse-rate: -dT/dz
  real(r8) :: gamma_env(ncol,pver)
  ! Min value for dT/dz
  real(r8) :: min_dtdz(ncol,pver)
  ! Max value of Kzz at each column
  real(r8):: egwdffi_max(ncol)

  ! Damping factor and sum over all heights of damping factor
  real(r8) :: dmp_factor(ncol,-band%ngwv:band%ngwv,pver+1)
  real(r8) :: dmp_sum(ncol,-band%ngwv:band%ngwv)

  ! (dp/dz)^2 == (gravit*rho)^2
  real(r8) :: dpidz_sq(ncol,pver+1)
  ! Lowest tendency level.
  integer :: kbot_tend
  ! Interface levels for gravity wave sources.
  integer, parameter :: ktop = 1
  ! LU decomposition.
  type(TriDiagDecomp) :: decomp 

  logical :: do_vertical_diffusion

  !Initialize arrays
  ttgw = 0._r8
  dttdf = 0._r8
  qtgw = 0._r8
  k_wave=0._r8
  k_dyn=0._r8
  dtdz=0._r8
  brnt_v=0._r8
  brnt_v_sq=0._r8
  xi=0._r8
  k_e=0._r8
  ! MMK START
  k_wave_new = 0._r8
  k_h_new = 0._r8
  k_dyn_c = 0._r8 
  k_dyn_h = 0._r8 
  kappa_tilde = 0._r8
  k_m_m = 0._r8
  k_h_m = 0._r8
  k_h_m_waccm = 0._r8
  ! MMK END
  var_t=0._r8

 !by default vertical diffusion is always done
 do_vertical_diffusion = .true.

 !compute adiabatic lapse rate(K/m) and cp/R ratio
 gamma_ad=gravit/cpair
 cp_r= cpair/R_air
 !compute temperature at interface (call function)
 ti(:,2:pver)=midpoint_interp(t)

 !Compute Brunt Vaisala frequency at interfaces using mid-poit temperatures (s-1)
   do k = pver-1,1,-1
      dtdz(:,k)=(t(:,k)-t(:,k+1))/(zm(:,k)-zm(:,k+1))  ! we are using t at mid-points so dtdz is computed at interfaces
      gamma_env(:,k)=-dtdz(:,k)
      brnt_v_sq(:,k)=gravit/ti(:,k+1)*(gamma_ad - gamma_env(:,k))
      brnt_v(:,k)=(max(brnt_v_sq_min, brnt_v_sq(:,k)))**0.5
   enddo
 !Bound dT/dz using the min value for the Brunt-Vaisala frequency (for numerical stability)
   do k =  pver-1,1,-1
      min_dtdz(:,k)=brnt_v_sq_min*(ti(:,k+1)/gravit)-gamma_ad
      dtdz(:,k)=max(min_dtdz(:,k), dtdz(:,k))
   enddo 

 !Compute the coriolis frequency (rad/s) and set it to 2pi/24h for equatorial regions (i.e. use a constant lat=30deg)
  where (abs(lat) <= 30._r8*degree_radian)
   coriolis_f=(2._r8*pi)/(24._r8*hr_sec)
  elsewhere
   coriolis_f=abs( (2._r8*pi*sin(lat))/(12._r8*hr_sec) )
  end where
  !Compute inertial period (s)
  inertial_prd= 2._r8*pi/coriolis_f

  !Compute Delta_z for later calculations of tau_dmp
   do k = pver,1,-1 
      delta_z(:,k)=zi(:,k)-zi(:,k+1) !we are at interfaces so start from pver instead of pver+1  			            
   enddo   

 
  !Find lowest level for computation of k_wave
  do k=1,pver+1
     if (pref_edge(k) .lt. 20000._r8) then !below 200hPa ~ 12km (above tropopause)
       kwave_level=k
     endif
  enddo

 !Compute momentum flux MF (m2/s2) from the wave stress tau (Pa) and damp it above 50km
 dmp_sum=0._r8
 DO k = kwave_level-1, 2, -1 !disregard first and last (kwave_level) interface values, the rest of variables 
			     !are defined with centred differences of mid-points values

  IF (k .eq. kwave_level-1) THEN

     do l = -band%ngwv, band%ngwv
         mom_flux(:,l,k)=tau(:,l,k)/rhoi(:,k)
     enddo
     
        ! compute k_wave with not damped tau at first level 
        if (present(kwvrdg)) then          
  		call compute_kwave (ncol, band, lambda_h, ti(:,k), rhoi(:,k), brnt_v(:,k-1), egwdffi(:,k),     &
           	     cp_r, gamma_ad, coriolis_f, inertial_prd, c_speed, ubi(:,k), mom_flux(:,:,k), kwave_level,  &
                 k_wave_new(:,k), k_h_new(:,k), & ! MMK
                 kappa_tilde(:,k), k_m_m(:,k), k_h_m(:,k), k_h_m_waccm(:,k), & 
                 kvtt(:,k), gw_prndl, & ! MMK END
                 dtdz(:,k-1), var_t(:,k), k_e(:,k), xi(:,k), k_wave(:,k), lambda_wave(:,:,k), kwvrdg=kwvrdg)      
 	else
  		call compute_kwave (ncol, band, lambda_h, ti(:,k), rhoi(:,k), brnt_v(:,k-1), egwdffi(:,k),     &
           	     cp_r, gamma_ad, coriolis_f, inertial_prd, c_speed, ubi(:,k), mom_flux(:,:,k), kwave_level,  &
                 k_wave_new(:,k), k_h_new(:,k), & ! MMK
                 kappa_tilde(:,k), k_m_m(:,k), k_h_m(:,k), k_h_m_waccm(:,k), & 
                 kvtt(:,k), gw_prndl, & ! MMK END 
                 dtdz(:,k-1), var_t(:,k), k_e(:,k), xi(:,k), k_wave(:,k), lambda_wave(:,:,k)) 
 	endif

 ELSE
  
     !damp tau using k_wave value just calculated 
      do l = -band%ngwv, band%ngwv
         dmp_factor(:,l,k)=lambda_wave(:,l,k+1)*delta_z(:,k) !damp tau using lambda_wave values from level below
         dmp_sum(:,l)=dmp_sum(:,l)+dmp_factor(:,l,k)     !sum all damping coefficients to calculate tau profile as we go up
	 tau_dmp(:,l,k)=tau(:,l,k)*exp(-2.*dmp_sum(:,l)) 
         mom_flux(:,l,k)=tau_dmp(:,l,k)/rhoi(:,k) 
      enddo
         

	 !compute k_wave using damped tau values
        if (present(kwvrdg)) then          
  		call compute_kwave (ncol, band, lambda_h, ti(:,k), rhoi(:,k), brnt_v(:,k-1), egwdffi(:,k),     &
           	     cp_r, gamma_ad, coriolis_f, inertial_prd, c_speed, ubi(:,k), mom_flux(:,:,k), kwave_level,  &
                 k_wave_new(:,k), k_h_new(:,k), & ! MMK
                 kappa_tilde(:,k), k_m_m(:,k), k_h_m(:,k), k_h_m_waccm(:,k), & 
                 kvtt(:,k), gw_prndl, & ! MMK END
                 dtdz(:,k-1), var_t(:,k), k_e(:,k), xi(:,k), k_wave(:,k), lambda_wave(:,:,k), kwvrdg=kwvrdg)          
 	else
  		call compute_kwave (ncol, band, lambda_h, ti(:,k), rhoi(:,k), brnt_v(:,k-1), egwdffi(:,k),     &
           	     cp_r, gamma_ad, coriolis_f, inertial_prd, c_speed, ubi(:,k), mom_flux(:,:,k), kwave_level,  &
                 k_wave_new(:,k), k_h_new(:,k), & ! MMK
                 kappa_tilde(:,k), k_m_m(:,k), k_h_m(:,k), k_h_m_waccm(:,k), & 
                 kvtt(:,k), gw_prndl, & ! MMK END
                 dtdz(:,k-1), var_t(:,k), k_e(:,k), xi(:,k), k_wave(:,k), lambda_wave(:,:,k)) 
 	endif 

   ENDIF
 ENDDO  


 !set variables at model top (k=1) and below kwave_level to  zero
  k_wave(:,1)=0._r8
  xi(:,1)=0._r8
  k_e(:,1)=0._r8
  ! MMK START
  k_wave_new(:,1)=0._r8
  k_h_new(:,1)=0._r8
  kappa_tilde(:,1)=0._r8
  k_m_m(:,1)=0._r8
  k_h_m(:,1)=0._r8
  k_h_m_waccm(:,1)=0._r8

  !psi_bar(:,1)=0._r8 ! MMK Uncomment if using
  ! MMK END
  var_t(:,1)=0._r8
  k_wave(:,kwave_level:)=0._r8
  xi(:,kwave_level:)=0._r8
  k_e(:,kwave_level:)=0._r8
  ! MMK START
  k_wave_new(:,kwave_level:)=0._r8
  k_h_new(:,kwave_level)=0._r8
  kappa_tilde(:,kwave_level:)=0._r8
  k_m_m(:,kwave_level:)=0._r8
  k_h_m(:,kwave_level:)=0._r8
  k_h_m_waccm(:,kwave_level:)=0._r8
  !psi_bar(:,kwave_level:)=0._r8 ! MMK Uncomment if using
  ! MMK END
  var_t(:,kwave_level:)=0._r8

!==================================================================
  IF (do_vertical_diffusion) then

 
  ! Calculate (dp/dz)^2.
   dpidz_sq = rhoi*gravit
   dpidz_sq = dpidz_sq*dpidz_sq

  !lowest level where tendencies are defined
   kbot_tend = maxval(tend_level)

   ! MMK CONSTITUENTS START 

  !define K_dyn
   where (k_wave .ne. 0._r8)
         k_dyn=(1._r8+xi)*egwdffi+k_wave
   elsewhere
         k_dyn=egwdffi
   end where

   !define K_dyn_c
    where (k_wave_new .ne. 0._r8)
         k_dyn_c = (k_wave_new + egwdffi)*(1._r8+xi) ! MMK
    elsewhere
         k_dyn_c=egwdffi
    end where

  !find max value of Kzz per each column 
  do i=1,ncol
    egwdffi_max(i)=MAXVAL(egwdffi(i,:))
    !set max value for k_dyn based on egwdffi_max (where Kzz is non zero)
    if (egwdffi_max(i) .ne. 0.) then
     do k=1,pver+1
      k_dyn(i,k)=min(k_dyn(i,k), egwdffi_max(i)) 
      k_dyn_c(i,k)=min(k_dyn_c(i,k), egwdffi_max(i)) ! MMK
     enddo 
    endif  
  enddo

   ! Decompose the diffusion matrix using k_dyn ! MMK - will in future use k_dyn_c 
   ! calculated from k_wave_new
   decomp = fin_vol_lu_decomp(dt, p%section([1,ncol],[ktop,kbot_tend]), &
        !coef_q_diff=k_dyn(:,ktop:kbot_tend+1)*dpidz_sq(:,ktop:kbot_tend+1)) ! OLD
         coef_q_diff=k_dyn_c(:,ktop:kbot_tend+1)*dpidz_sq(:,ktop:kbot_tend+1)) ! MMK


   ! Calculate tendency on each constituent.
     do m_q = 1, size(q,3)

        call gw_diff_tend(ncol, pver, kbot_tend, ktop, q(:,:,m_q), &
             dt, decomp, qtgw(:,:,m_q))

     enddo
   ! MMK CONSTITUENTS END

   ! MMK TEMPERATURE START

   ! define k_dyn_h
    k_dyn_h = (k_h_new + egwdffi)*(1._r8+xi)

    ! MMK Impose any final conditions on k_dyn_h

    !ensure k_dyn_h is less than or equal to k_dyn_c
    do i=1,ncol
      do k=1,pver+1
        if (k_dyn_h(i,k) >= k_dyn_c(i,k)) then
          k_dyn_h(i,k) = k_dyn_c(i,k)
        endif
      enddo  
    enddo 

   ! Decompose the diffusion matrix using k_dyn_h
    decomp = fin_vol_lu_decomp(dt, p%section([1,ncol],[ktop,kbot_tend]), & 
           ! coef_q_diff=k_dyn(:,ktop:kbot_tend+1)*dpidz_sq(:,ktop:kbot_tend+1)) ! OLD
            coef_q_diff=k_dyn_h(:,ktop:kbot_tend+1)*dpidz_sq(:,ktop:kbot_tend+1))  

     ! Calculate tendency from diffusing dry static energy (dttdf).
     call gw_diff_tend(ncol, pver, kbot_tend, ktop, dse, dt, decomp, dttdf)

     !calculate total temperature tendency (dttke has been alredy computed in gw_common)
     ttgw = dttke + dttdf

     if (associated(vramp)) then
       do k = ktop, kbot_tend
          ttgw(:,k) = ttgw(:,k) * vramp(k)
       enddo
     endif

    ! MMK TEMPERATURE END

    ! Deallocate decomp.
     call decomp%finalize()

  ENDIF

end subroutine effective_gw_diffusivity

!==========================================================================
subroutine compute_kwave (ncol, band, lambda_h, ti, rhoi, brnt_v, egwdffi,     &
           	     cp_r, gamma_ad, coriolis_f, inertial_prd, c_speed, ubi, mom_flux, kwave_level,  &
                 k_wave_new, k_h_new, & ! MMK
                 kappa_tilde, k_m_m, k_h_m, k_h_m_waccm, &
                 kvtt, gw_prndl, & ! MMK
           	     dtdz, var_t, k_e, xi, k_wave, lambda_wave, kwvrdg)  

!--------------------------------------------------------------------------------------------------
! Compute Var(T') (total variance of gw temp perturbations) and quantities that depends on it 
! such as and K_e and xi. Finally compute K_wave. 
!--------------------------------------------------------------------------------------------------
use gw_common, only: GWBand, pver, pi
use physconst, only: gravit
!------------------------------Arguments--------------------------------
  ! Column dimension.
  integer, intent(in) :: ncol
  ! band of phase speeds c within which waves are emitted
  type(GWBand), intent(in) :: band
  ! horizonatal wavelength
  real(r8), intent(in) :: lambda_h
  ! Interface temperature.
  real(r8), intent(in) :: ti(ncol)
  ! Interface density (Kg m-3)
  real(r8), intent(in) :: rhoi(ncol)
  ! Effective gravity wave diffusivity at interfaces.
  real(r8), intent(in) :: egwdffi(ncol)   
  !cCoriolis frequency 
  real(r8), intent(in)  :: coriolis_f(:), inertial_prd(:)
  ! Adiabatic lapse rate and cp/R ratio
  real(r8), intent(in) :: gamma_ad, cp_r 
  ! Projection of wind at interfaces.
  real(r8), intent(in) :: ubi(ncol)
  ! The absolute momenum flux computed from tau
  real(r8), intent(in) :: mom_flux(ncol,-band%ngwv:band%ngwv)
  ! Wave phase speeds for each column.
  real(r8), intent(in) :: c_speed(ncol,-band%ngwv:band%ngwv)
  ! Brunt Vaisala frequency
  real(r8), intent(in) :: brnt_v(ncol)   
  ! Environmental dT/dz (K/m)
  real(r8), intent(in)  :: dtdz(ncol) 
  ! horizontal wavenumber [anisotropic orography].
  real(r8), intent(in), optional :: kwvrdg(ncol)
 
  ! Variance of gw temperature perturbations
  real(r8), intent(out) :: var_t(ncol)
  ! Wave energy flux
  real(r8), intent(out) :: k_e(ncol)
  ! Instability parameter
  real(r8), intent(out) :: xi(ncol)
  ! Effective wave diffusivity k_wave
  real(r8), intent(out) :: k_wave(ncol)
  ! Damping factor for tau profile
  real(r8), intent(out) :: lambda_wave(ncol,-band%ngwv:band%ngwv)

  ! MMK declare arguments
  ! Gw Prandtl Number
  real(r8), intent(in) :: gw_prndl
  ! WACCM "Molecular Thermal Diffusivity"
  real(r8), intent(in) :: kvtt(ncol)
  ! New effective wave diffusivity k_wave_new
  real(r8), intent(out) :: k_wave_new(ncol)
  ! New thermal diffusivity k_h_new
  real(r8), intent(out) :: k_h_new(ncol)
  ! Kappa tilde - no official name
  real(r8), intent(out) :: kappa_tilde(ncol)
  ! Molecular kinematic viscosity
  real(r8), intent(out) :: k_m_m(ncol)
  ! Molecular diffusivity for heat
  real(r8), intent(out) :: k_h_m(ncol)
 ! Molecular diffusivity of heat WACCM for testing
  real(r8), intent(out) :: k_h_m_waccm(ncol) ! = gw_prndl*kvtt in compute_kwave

  
  !---------------------------Local storage-------------------------------

  ! Level, wavenumber, constituent and column loop indices.
  integer :: k, l, i, kwave_level
  ! The vertical wavelength and the lmbd_h/lmbd_z ratio
  real(r8) :: lambda_z(ncol,-band%ngwv:band%ngwv) 
  real(r8) :: lambda_ratio(ncol,-band%ngwv:band%ngwv) 
  ! horizontal wavelength  [anisotropic orography]
  real(r8) :: lambda_h_rdg(ncol)
  ! GW intrinsic frequency 
  real(r8) :: gw_frq(ncol,-band%ngwv:band%ngwv) 
  ! Vertical wavenumber m
  real(r8) :: m(ncol,-band%ngwv:band%ngwv) 
  ! GW intrinsic phase speed
  real(r8) :: c_i(ncol,-band%ngwv:band%ngwv)
  ! GW temperature perturbation
  real(r8) :: gw_t(ncol,-band%ngwv:band%ngwv) 
  ! Characteristic Vertical wavelength
  real(r8):: lmbd_z_star(ncol)
  ! Buoyancy vertical wavenumber squared (1/m2)
  real(r8), parameter :: m_b_sq=(2*pi/1000.)**2.	
  ! Tunable parameter to bound instability parameter
  real(r8), parameter :: alpha=1./8., alpha_dwn=0.33
  ! Upper and lower limit for normalized temperature variance
  real(r8) :: upper_limit, lower_limit
  ! ubi-c
  real(r8):: ubic(ncol,-band%ngwv:band%ngwv)
  !Temporary values used for calculations locally
  real(r8), dimension(ncol) :: g_NT_sq
  real(r8), dimension(ncol) :: lapse_rate_sq, f_n, & 
			       normalized_varT, one_min_xi	
 		      
  ! MMK local storage
  ! Compressibility parameter, initially tunable
  real(r8), parameter :: psi_bar = 0.2 
  ! Tunable Prandtl number 
  real(r8), parameter :: pr = 1 !(use gw_prndl? MMK)
  real(r8), parameter :: eta = 8.4 ! MMK - tunable parameter
  real(r8), parameter :: psi_bar_norm = 0.175 ! MMK - tunable parameter
  ! only use with k_h_new using psi_bar_norm - comment out other k_h_new around lines 700

  ! MMK for computing kappa_tilde
  ! Gas consant for dry air (m2 K-1 s-2)
  real(r8), parameter :: R_air = 287._r8
  ! g/R ratio
  real(r8) :: g_R 
  g_R = gravit/R_air



!compute gw intrinsic speed, frequency and vertical wavenumber
do i=1,ncol
  do l = -band%ngwv, band%ngwv       
	
         c_i(i,l)=c_speed(i,l)-ubi(i) 

         IF (c_i(i,l) .ne. 0) then
	   gw_frq(i,l)=abs(c_i(i,l))/lambda_h

           if (present(kwvrdg)) then
            m(i,l)= (brnt_v(i)*kwvrdg(i))/gw_frq(i,l)
	   else
            m(i,l)= (brnt_v(i)*band%kwv)/gw_frq(i,l)
	   endif
         ELSE
          !at critical levels where c_i=0 (i.e. c=ubi) tau=0
	  !set everything else to zero too otherwise later on in the
	  !computation of m we get division by zeros and generation of NaNs and Inf
          gw_frq(i,l)=0._r8  
	  m(i,l)=0._r8
         ENDIF
      
  enddo
enddo

!compute variance of tot temperature perturbation Var(T') = SUM(0.5*T'^2) across whole spectrum 
do i=1,ncol
  var_t(i)=0._r8
  do l = -band%ngwv, band%ngwv

      ! exclude critical levels where c_i=0 and thus gw_freq=0 and m=0
      IF (gw_frq(i,l) .ne. 0._r8) then           
	lambda_z(i,l)= (2.*pi)/m(i,l)

        if (present(kwvrdg)) then
         lambda_h_rdg(i)= (2*pi)/kwvrdg(i)
         lambda_ratio(i,l)=lambda_z(i,l)/lambda_h_rdg(i)
        else
         lambda_ratio(i,l)=lambda_z(i,l)/lambda_h
	endif

	!use MF (m2/s2) to compute T' (K) using the polarization eqs and dispersion 
        !relationship for mid-frequency GWs (see e.g. see Ern et al 2004)
        g_NT_sq(i)= ( gravit/(brnt_v(i)*ti(i)) )**2.
        gw_t(i,l)= ( mom_flux(i,l)/(0.5*lambda_ratio(i,l)*g_NT_sq(i)) )**0.5 ! MF and T' are computed at interfaces (k+1/2)

        !compute Var(T')
        var_t(i)= var_t(i)+ 0.5*gw_t(i,l)**2.
        if (gw_t(i,l) .ne. 0.)then
        endif
     ELSE !set contribution from waves with gw_freq=0 to total variance to zero
        var_t(i)= var_t(i)+ 0._r8
     ENDIF

  enddo
enddo 

 !Compute K_e (energy flux due to waves) and xi (instability parameter)
 !Compute kappa_tilde, and k_h_m MMK
 do i=1,ncol

     lapse_rate_sq(i)= (gamma_ad+dtdz(i))**2. 
     normalized_varT(i)=var_t(i)/lapse_rate_sq(i)
     f_n(i)=1.-(4./3.)*sqrt(coriolis_f(i)/brnt_v(i))

     kappa_tilde(i) = (gamma_ad + dtdz(i))/(g_R + dtdz(i)) ! MMK

     !MMK Compute molecular diffusivity for heat
     ! 1. k_h_m(i) = kvtt(i) 

     ! or 

     ! 2. Following CAM Scientific Guide 
     !https://ncar.github.io/CAM/doc/build/html/cam6_scientific_guide/extensions.html#:~:text=be%20omitted%20here.-,7.6.2.1.%20molecular%20viscosity%20and%20diffusivity,-The%20empirical%20formula

      ! Calculate Prandtl Number (use prndl? Currently using local pr = 1 ) ! MMK
      ! 2.1 pr(i) = ?   
      ! 2.2 pr = prndl ?
      ! 2.3 Currently pr = 1 - set in local storage definition of MOD:gw_chem--SR:compute_kwave
      ! gw_prndl = pr

     ! Calculate molecular kinematic viscosity
     k_m_m(i) = 3.55*(10**-7)*ti(i)**(2/3)/rhoi(i) 
     ! Calculate molecular diffusivity of heat
     k_h_m(i) = gw_prndl*k_m_m(i) ! Molecular diffusivity for heat
    !  k_h_m_waccm(i) = gw_prndl*kvtt(i)


     !impose constraint on normalized temperature varaiance so that 0 < xi < 1
     lower_limit= alpha/2._r8*m_b_sq   
     upper_limit= (alpha/m_b_sq)*(exp((2._r8/alpha) - 0.5) - 0.5)
     if ( (normalized_varT(i) .gt. lower_limit) .and. (normalized_varT(i) .lt. upper_limit) ) then 
      lmbd_z_star(i)=(2._r8*pi)*sqrt( (1._r8/alpha)*normalized_varT(i) + 1/(2._r8*m_b_sq) )
      k_e(i)=normalized_varT(i)*( (4.*f_n(i)*gamma_ad*(1.-2.*alpha_dwn))/ti(i) )*(lmbd_z_star(i)/inertial_prd(i)) 
      xi(i)=alpha/4. + alpha/2. *log( (m_b_sq/alpha)*normalized_varT(i) + 0.5)
      xi(i)=min(0.99, xi(i)) !should not happen, but bound xi so that xi .ge. 1 cannot exist 
     else
      k_e(i)=0._r8
      xi(i)=0._r8
      var_t(i)=0._r8 !set also variance to zero if not within resonable bounds
     endif     
  enddo


!Finally compute k_wave
   one_min_xi(:) =1.-xi(:)    
   k_wave(:)=(1./one_min_xi(:))*( xi(:)*egwdffi(:)+ & 
                   (cp_r-1.)*k_e(:) )


!Finally compute k_h_new MMK
  ! k_h_new(:)=(xi(:)/(psi_bar/kappa_tilde(:)+1.-2.*xi(:)))*((cp_r-1.)*k_e(:) + egwdffi(:) + k_h_m(:)) ! MMK No proxy
  ! k_h_new(:)= eta*kappa_tilde(:)*xi(:)*((cp_r-1.)*k_e(:) + egwdffi(:) + k_h_m(:))! MMK Proxy
  k_h_new(:) = ((eta*kappa_tilde(:)*xi(:))/(psi_bar_norm*(1. - kappa_tilde(:)) + (1. - 2.*xi(:))*kappa_tilde(:)))*((cp_r-1.)*k_e(:) + egwdffi(:) + k_h_m(:))! MMK using psi_bar_norm
  
!Finally compute k_wave_new MMK
  k_wave_new(:)=(cp_r-1.)*k_e(:) + k_h_new(:)


 !Compute the damping factor (lambda_wave) to define the profile of tau_dmp in the main program
  do l = -band%ngwv, band%ngwv
   ubic(:,l)=ubi(:)-c_speed(:,l)
   !lambda_wave(:,l)= (brnt_v(:)**3./(band%kwv*ubic(:,l)**4.))*(k_wave(:)+egwdffi(:))
  lambda_wave(:,l)= (brnt_v(:)**3./(band%kwv*ubic(:,l)**4.))*(k_wave_new(:)+egwdffi(:)) ! MMK
  enddo

end subroutine compute_kwave

end module gw_chem
  
