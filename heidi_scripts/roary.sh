#!/bin/bash

#SBATCH --job-name=roary
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

roary=~/bin/roary.sif #roary container

inputdir=$1 #typically should be formatted as /path/to/dir/, program will use anything with .gff within that directory

apptainer exec --bind /scratch/$USER/ --bind /projects/$USER/ ${roary} roary -i 70 -p 48 -r ${inputdir}/*.gff
