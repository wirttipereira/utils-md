export I_MPI_FABRICS=shm
export OMP_NUM_THREADS=1

source /opt/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /opt/intel/impi/2019.6.166/intel64/bin/mpivars.sh
source /opt/intel/mkl/bin/mklvars.sh intel64
#cd $PBS_O_WORKDIR
/home/rafagp/exe/lmp-mpi-intel -sf opt -in in.lmp
#in.rafael

