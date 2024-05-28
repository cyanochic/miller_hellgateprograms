#!/bin/bash

#SBATCH --job-name=pan_genome_plots
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

roary=~/bin/roary.sif #roary container

apptainer exec --bind /scratch/$USER/ --bind /projects/$USER/ ${roary} create_pan_genome_plots.R *.Rtab
