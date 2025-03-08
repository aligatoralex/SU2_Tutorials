#!/bin/bash

#SBATCH --job-name=su2_cfd_job
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12 # Adjust based on your needs
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem=16gb
#SBATCH --partition=topola
#SBATCH --account=alekscze

# Load necessary modules
module load mpi/openmpi-x86_64

# Navigate to the directory containing your SU2 CFD configuration file
cd ~/SU2_TUTORIALS

# Run SU2 CFD in parallel using mpirun
mpirun -np $SLURM_NTASKS runs/onera6m/inv_ONERAM6.cfg > su2_cfd.out 2>&1
