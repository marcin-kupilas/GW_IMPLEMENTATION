## Hosts assigned to job 4459233.1:
##
## d11s6b4.arc4.leeds.ac.uk 40 slots
##
## Resources granted:
##
## h_vmem = 4G (per slot)
## h_rt   = 24:00:00
## disk   = 1G (per slot)

## nodes/ppn parallel request:
##
## nodes = 1     np  = 40   
## ppn   = 40    tpp = 1    

Setting Environment MKL=-mkl
Setting Environment OMP_STACKSIZE=64M
GET_REFCASE is false, the user is expected to stage the refcase to the run directory.
Creating component namelists
  2023-01-07 21:52:41 atm 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/components/cam//cime_config/buildnml
CAM namelist copy: file1 /nobackup/phymku/cesm_sims/2.2.0/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/Buildconf/camconf/atm_in file2 /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/atm_in 
  2023-01-07 21:52:41 lnd 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/components/clm//cime_config/buildnml
  2023-01-07 21:52:42 ice 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/components/cice//cime_config/buildnml
  2023-01-07 21:52:43 ocn 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/data_comps_mct/docn/cime_config/buildnml
  2023-01-07 21:52:43 rof 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/components/mosart//cime_config/buildnml
  2023-01-07 21:52:43 glc 
   Running /home/home01/earfw/CESM2/release-cesm2.2.0/components/cism//cime_config/buildnml 
  2023-01-07 21:52:47 wav 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/swav/cime_config/buildnml
  2023-01-07 21:52:47 iac 
   Running /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/siac/cime_config/buildnml 
  2023-01-07 21:52:48 esp 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/sesp/cime_config/buildnml
  2023-01-07 21:52:48 cpl 
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
Generating namelists for /nobackup/phymku/cesm_sims/2.2.0/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001
GET_REFCASE is false, the user is expected to stage the refcase to the run directory.
Creating component namelists
  2023-01-07 21:52:49 atm 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/components/cam//cime_config/buildnml
CAM namelist copy: file1 /nobackup/phymku/cesm_sims/2.2.0/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/Buildconf/camconf/atm_in file2 /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/atm_in 
  2023-01-07 21:52:49 lnd 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/components/clm//cime_config/buildnml
  2023-01-07 21:52:50 ice 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/components/cice//cime_config/buildnml
  2023-01-07 21:52:50 ocn 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/data_comps_mct/docn/cime_config/buildnml
  2023-01-07 21:52:50 rof 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/components/mosart//cime_config/buildnml
  2023-01-07 21:52:50 glc 
   Running /home/home01/earfw/CESM2/release-cesm2.2.0/components/cism//cime_config/buildnml 
  2023-01-07 21:52:54 wav 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/swav/cime_config/buildnml
  2023-01-07 21:52:54 iac 
   Running /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/siac/cime_config/buildnml 
  2023-01-07 21:52:54 esp 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/components/stub_comps_mct/sesp/cime_config/buildnml
  2023-01-07 21:52:54 cpl 
   Calling /home/home01/earfw/CESM2/release-cesm2.2.0/cime/src/drivers/mct/cime_config/buildnml
   NOTE: ignoring setting of rof2ocn_liq_rmapname=idmap in seq_maps.rc
   NOTE: ignoring setting of rof2ocn_fmapname=idmap in seq_maps.rc
   NOTE: ignoring setting of rof2ocn_ice_rmapname=idmap in seq_maps.rc
-------------------------------------------------------------------------
 - Prestage required restarts into /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run
 - Case input data directory (DIN_LOC_ROOT) is /nobackup/earfw/cesm2_inputdata/ 
 - Checking for required input datasets in DIN_LOC_ROOT
-------------------------------------------------------------------------
run command is mpirun  /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/bld/cesm.exe   >> cesm.log.$LID 2>&1  
check for resubmit
dout_s True 
mach arc4 
resubmit_num 0
Submit job case.st_archive
Starting job script case.st_archive
st_archive starting
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/cesm.log.230107-215249.gz to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/logs/cesm.log.230107-215249.gz
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/rof.log.230107-215249.gz to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/logs/rof.log.230107-215249.gz
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/glc.log.230107-215249.gz to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/logs/glc.log.230107-215249.gz
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/ice.log.230107-215249.gz to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/logs/ice.log.230107-215249.gz
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/cpl.log.230107-215249.gz to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/logs/cpl.log.230107-215249.gz
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/atm.log.230107-215249.gz to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/logs/atm.log.230107-215249.gz
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/lnd.log.230107-215249.gz to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/logs/lnd.log.230107-215249.gz
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/ocn.log.230107-215249.gz to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/logs/ocn.log.230107-215249.gz
-------------------------------------------
Archiving restarts for date date(2006, 2, 1, 0, 0, 0)
-------------------------------------------
Archiving restarts for cam (atm)
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.r.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.r.2006-02-01-00000.nc
Copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-02-01-00000.nc
Copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h6.2006-01-31-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h6.2006-01-31-00000.nc
Copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h7.2006-01-31-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h7.2006-01-31-00000.nc
Copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-02-01-00000.nc
Copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h2.2006-01.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h2.2006-01.nc
 WARNING: ncdump -v nhfil /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.rs.2006-02-01-00000.nc  failed rc=1
    out=
    err=ncdump: nhfil: No such variable
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.rs.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.rs.2006-02-01-00000.nc
Archiving restarts for clm (lnd)
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.clm2.r.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.clm2.r.2006-02-01-00000.nc
Copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.clm2.h0.2006-01.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.clm2.h0.2006-01.nc
 WARNING: ncdump -v locfnh /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.clm2.rh0.2006-02-01-00000.nc  failed rc=1
    out=
    err=ncdump: locfnh: No such variable
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.clm2.rh0.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.clm2.rh0.2006-02-01-00000.nc
Archiving restarts for cice (ice)
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cice.r.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cice.r.2006-02-01-00000.nc
Archiving restarts for docn (ocn)
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.docn.rs1.2006-02-01-00000.bin to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.docn.rs1.2006-02-01-00000.bin
Archiving restarts for mosart (rof)
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.mosart.r.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.mosart.r.2006-02-01-00000.nc
Copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.mosart.h0.2006-01.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.mosart.h0.2006-01.nc
 WARNING: ncdump -v locfnh /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.mosart.rh0.2006-02-01-00000.nc  failed rc=1
    out=
    err=ncdump: locfnh: No such variable
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.mosart.rh0.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.mosart.rh0.2006-02-01-00000.nc
Archiving restarts for cism (glc)
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cism.r.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cism.r.2006-02-01-00000.nc
Archiving restarts for drv (cpl)
copying file /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cpl.r.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rest/2006-02-01-00000/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cpl.r.2006-02-01-00000.nc
Archiving restarts for dart (esp)
Archiving history files for cam (atm)
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-01-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-02-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-02-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-03-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-03-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-04-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-04-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-05-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-05-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-06-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-06-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-07-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-07-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-08-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-08-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-09-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-09-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-10-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-10-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-11-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-11-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-12-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-12-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-13-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-13-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-14-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-14-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-15-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-15-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-16-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-16-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-17-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-17-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-18-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-18-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-19-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-19-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-20-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-20-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-21-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-21-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-22-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-22-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-23-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-23-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-24-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-24-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-25-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-25-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-26-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-26-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-27-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-27-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-28-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-28-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-29-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-29-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-30-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-30-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-31-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-01-31-00000.nc 
copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h0.2006-02-01-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-01-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-02-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-02-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-03-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-03-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-04-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-04-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-05-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-05-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-06-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-06-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-07-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-07-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-08-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-08-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-09-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-09-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-10-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-10-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-11-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-11-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-12-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-12-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-13-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-13-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-14-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-14-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-15-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-15-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-16-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-16-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-17-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-17-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-18-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-18-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-19-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-19-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-20-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-20-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-21-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-21-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-22-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-22-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-23-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-23-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-24-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-24-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-25-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-25-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-26-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-26-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-27-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-27-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-28-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-28-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-29-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-29-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-30-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-30-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-31-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-01-31-00000.nc 
copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-02-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h1.2006-02-01-00000.nc 
copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h2.2006-01.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h2.2006-01.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h6.2006-01-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h6.2006-01-01-00000.nc 
copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h6.2006-01-31-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h6.2006-01-31-00000.nc 
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h7.2006-01-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h7.2006-01-01-00000.nc 
copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h7.2006-01-31-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/atm/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cam.h7.2006-01-31-00000.nc 
Archiving history files for clm (lnd)
copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.clm2.h0.2006-01.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/lnd/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.clm2.h0.2006-01.nc 
Archiving history files for cice (ice)
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cice.h.2006-01.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/ice/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cice.h.2006-01.nc 
Archiving history files for docn (ocn)
Archiving history files for mosart (rof)
copying /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.mosart.h0.2006-01.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/rof/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.mosart.h0.2006-01.nc 
Archiving history files for cism (glc)
moving /nobackup/phymku/cesm2/cases/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/run/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cism.initial_hist.2006-01-01-00000.nc to /nobackup/phymku/cesm2/archive/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001/glc/hist/f.e22.FWmaHIST.f19_f19_mg17.CTRL.heatcool.001.cism.initial_hist.2006-01-01-00000.nc 
Archiving history files for drv (cpl)
Archiving history files for dart (esp)
st_archive completed
Submitted job case.run with id None
Submitted job case.st_archive with id None
