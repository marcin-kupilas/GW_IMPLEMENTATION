if [ "$SERVICE_NAME" = "arc4" ]; then
export CIME_MODEL=cesm
export CCSMUSER=$USER
if [ ! -d /nobackup/$USER/cesm2_inputdata ]; then
ln -s /nobackup/earfw/cesm2_inputdata /nobackup/$USER/cesm2_inputdata
fi
# Load Modules
if [ -r /nobackup/cemac/cemac.sh ] ; then
   . /nobackup/cemac/cemac.sh
fi
#intel
module load netcdf
module load cmake
module load python/2.7.16
module load mkl 
module load hdf5
export ESMF_DIR=/nobackup/earfw/CESM2/esmf_arc4_03102022
export ESMF_COMM=openmpi
export ESMF_COMPILER=intel
export ESMF_ABI=64
export ESMF_OS=Linux
export NETCDF=$NETCDF_HOME
export NETCDF_PATH=$NETCDF_HOME
fi

