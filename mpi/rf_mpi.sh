#!/bin/bash
#PBS -N rf_mpi
#PBS -l select=1:ncpus=128,walltime=00:50:00
#PBS -q qexp
#PBS -e rf_mpi.e
#PBS -o rf_mpi.o

cd ~/KPMS-IT4I-EX/mpi
pwd

module load R
echo "loaded R"

# Fix for warnings from libfabric/1.12 bug
module swap libfabric/1.12.1-GCCcore-10.3.0 libfabric/1.13.2-GCCcore-11.2.0 

time mpirun -np 32 --oversubscribe Rscript rf_mpi.R
time mpirun -np 64 --oversubscribe Rscript rf_mpi.R