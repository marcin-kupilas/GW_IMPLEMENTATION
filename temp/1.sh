## Hosts assigned to job 4527576.1:
##
## d10s6b1.arc4.leeds.ac.uk 40 slots
## d12s6b3.arc4.leeds.ac.uk 40 slots
##
## Resources granted:
##
## h_vmem = 4G (per slot)
## h_rt   = 01:00:00
## disk   = 1G (per slot)

## nodes/ppn parallel request:
##
## nodes = 2     np  = 80   
## ppn   = 40    tpp = 1    

Setting Environment MKL=-mkl
Setting Environment OMP_STACKSIZE=64M
GET_REFCASE is false, the user is expected to stage the refcase to the run directory.
Creating component namelists
  2023-01-18 19:55:06 atm 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/cam//cime_config/buildnml
CAM namelist copy: file1 /nobackup/phymku/cesm_sims/2.2.0/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/Buildconf/camconf/atm_in file2 /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/atm_in 
  2023-01-18 19:55:07 lnd 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/clm//cime_config/buildnml
  2023-01-18 19:55:08 ice 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/cice//cime_config/buildnml
  2023-01-18 19:55:08 ocn 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/data_comps_mct/docn/cime_config/buildnml
  2023-01-18 19:55:08 rof 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/mosart//cime_config/buildnml
  2023-01-18 19:55:08 glc 
   Running /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/cism//cime_config/buildnml 
  2023-01-18 19:55:13 wav 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/swav/cime_config/buildnml
  2023-01-18 19:55:13 iac 
   Running /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/siac/cime_config/buildnml 
  2023-01-18 19:55:13 esp 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/sesp/cime_config/buildnml
  2023-01-18 19:55:13 cpl 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/drivers/mct/cime_config/buildnml
   NOTE: ignoring setting of rof2ocn_liq_rmapname=idmap in seq_maps.rc
   NOTE: ignoring setting of rof2ocn_fmapname=idmap in seq_maps.rc
   NOTE: ignoring setting of rof2ocn_ice_rmapname=idmap in seq_maps.rc
Checking that inputdata is available as part of case submission
Setting Environment MKL=-mkl
Setting Environment OMP_STACKSIZE=64M
Loading input file list: 'Buildconf/mosart.input_data_list'
Loading input file list: 'Buildconf/cice.input_data_list'
Loading input file list: 'Buildconf/cam.input_data_list'
Loading input file list: 'Buildconf/docn.input_data_list'
Loading input file list: 'Buildconf/clm.input_data_list'
Loading input file list: 'Buildconf/cism.input_data_list'
Loading input file list: 'Buildconf/cpl.input_data_list'
GET_REFCASE is false, the user is expected to stage the refcase to the run directory.
Check case OK
submit_jobs case.run
Submit job case.run
Starting job script case.run
Setting Environment MKL=-mkl
Setting Environment OMP_STACKSIZE=64M
Generating namelists for /nobackup/phymku/cesm_sims/2.2.0/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001
GET_REFCASE is false, the user is expected to stage the refcase to the run directory.
Creating component namelists
  2023-01-18 19:55:14 atm 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/cam//cime_config/buildnml
CAM namelist copy: file1 /nobackup/phymku/cesm_sims/2.2.0/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/Buildconf/camconf/atm_in file2 /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/atm_in 
  2023-01-18 19:55:14 lnd 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/clm//cime_config/buildnml
  2023-01-18 19:55:15 ice 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/cice//cime_config/buildnml
  2023-01-18 19:55:15 ocn 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/data_comps_mct/docn/cime_config/buildnml
  2023-01-18 19:55:15 rof 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/mosart//cime_config/buildnml
  2023-01-18 19:55:15 glc 
   Running /home/home01/earfw/CESM2/release-cesm2.2.0/cime/../components/cism//cime_config/buildnml 
  2023-01-18 19:55:19 wav 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/swav/cime_config/buildnml
  2023-01-18 19:55:19 iac 
   Running /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/siac/cime_config/buildnml 
  2023-01-18 19:55:19 esp 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/sesp/cime_config/buildnml
  2023-01-18 19:55:19 cpl 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/drivers/mct/cime_config/buildnml
   NOTE: ignoring setting of rof2ocn_liq_rmapname=idmap in seq_maps.rc
   NOTE: ignoring setting of rof2ocn_fmapname=idmap in seq_maps.rc
   NOTE: ignoring setting of rof2ocn_ice_rmapname=idmap in seq_maps.rc
-------------------------------------------------------------------------
 - Prestage required restarts into /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run
 - Case input data directory (DIN_LOC_ROOT) is /nobackup/earfw/cesm2_inputdata/ 
 - Checking for required input datasets in DIN_LOC_ROOT
-------------------------------------------------------------------------
run command is mpirun  /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/bld/cesm.exe   >> cesm.log.$LID 2>&1  
Exception from case_run: ERROR: RUN FAIL: Command 'mpirun  /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/bld/cesm.exe   >> cesm.log.$LID 2>&1 ' failed
See log file for details: /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/cesm.log.230118-195514
Submit job case.st_archive
Starting job script case.st_archive
st_archive starting
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/cpl.log.230118-195514 to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/logs/cpl.log.230118-195514
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/cesm.log.230118-195514 to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/logs/cesm.log.230118-195514
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/lnd.log.230118-195514 to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/logs/lnd.log.230118-195514
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/ocn.log.230118-195514 to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/logs/ocn.log.230118-195514
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/ice.log.230118-195514 to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/logs/ice.log.230118-195514
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/atm.log.230118-195514 to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/logs/atm.log.230118-195514
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/glc.log.230118-195514 to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/logs/glc.log.230118-195514
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/rof.log.230118-195514 to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/logs/rof.log.230118-195514
Cannot find a f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001.cpl*.r.*.nc file in directory /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run 
Archiving history files for cam (atm)
Archiving history files for clm (lnd)
Archiving history files for cice (ice)
Archiving history files for docn (ocn)
Archiving history files for mosart (rof)
Archiving history files for cism (glc)
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001.cism.initial_hist.2006-01-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001/glc/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.clone.branch_test.001.cism.initial_hist.2006-01-01-00000.nc 
Archiving history files for drv (cpl)
Archiving history files for dart (esp)
st_archive completed
Submitted job case.run with id None
Submitted job case.st_archive with id None