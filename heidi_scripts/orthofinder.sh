#!/bin/bash

#SBATCH --job-name=orthofinder
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

orthofinder=~/bin/orthofinder.sif #orthofinder container
faa=$1 #path to .faa directory
prefix=$2
output=$3 #path to desired output directory, WON'T RUN IF DIR ALREADY EXISTS


apptainer exec --bind /scratch/$USER/ --bind /projects/$USER/  ${orthofinder} orthofinder -f $1 -M msa -oa -n ${prefix} -o ${output}
