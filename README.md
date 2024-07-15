###Run CESM2 with Kdyn code ###

1) copy the following modules to cesm2/cases/../SourceMods/src.cam

gw_chem.F90  
gw_common.F90  
gw_diffusion.F90  
gw_drag.F90

2) gw_chem.F90 is a new module added to the model source code, I found that for the model to compile fine (the first time only) I needed to add a blank file named gw_chem.F90 in the model source code*. Thus: 
create a blank file named 'gw_chem.F90' in your copy of the model release (e.g. release_cesm2_2_0/components/cam/src/physics/cam/)
*there might be a better way around this

3) Add a new namelist variable:
cd into, e.g., release_cesm2_2_0/components/cam/bld/namelist_files/ and edit namelist_definition.xml adding the following lines in the <!-- Gravity Wave Drag --> section:

<entry id="use_gw_chem" type="logical" category="gw_drag"
       group="gw_drag_nl" valid_values="" >
Whether or not to use the gw_chem.F90 module.
Default: set by build-namelist
</entry>

4) add the following to your user_nl_cam namelist:

&cam_history_nl


 avgflag_pertape		= 'A', 'A'


 fincl1 = '' 
 fincl2	= 'U','V','T','TH','OMEGA','WSUB','PMID', 'RHO_CLUBB', 'Z3','k_wave_tot', 'EKGW', 'B_k_wave', 'B_k_e', 'B_EKGW', 'C_k_wave', 'C_k_e', 'C_EKGW', 'k_wave_orog_tot_BETA', 'k_e_orog_tot_BETA', 'EKGW_orog_tot_BETA', 'var_gwt_tot', 'k_dyn_tot'


 mfilt		= 1, 1
 nhtfrq		= 0, 0
/


/
&gw_drag_nl
 use_gw_chem 			= .true.
 use_gw_rdg_beta		= .true.
 use_gw_rdg_gamma		= .false.
/ 

/
&phys_ctl_nl
 use_gw_convect_dp		= .true.
 use_gw_convect_sh		= .false.
 use_gw_front			= .true.
 use_gw_front_igw		= .false.
 use_gw_oro			= .false.

N.B.: these are the cesm2.2 default options for  gw_drag_nl and phys_ctl_nl, the sole addition is use_gw_chem = .true.

# MMK notes

Any code mods to be used should be renamed appropriately to work with WACCM. E.g. gw_drag_mmk_final.F90 should be renamed
to gw_drag.F90 before compiling.

Any mmk mods need to be compiled with the *final_MVG.F90 mods.


- gw_drag_mmk_final - gw_drag module that works with new implementation of theory including effects of compressibility 

- gw_chem_mmk_final - gw_chem module ""


- gw_drag_mmk_const_tend - code that works with new implementation, but also includes constituent tendency output fields

- gw_drag_mmk_ctrl_const_tend - code that includes constituent tendency output fields that works with standard ctrl WACCM
