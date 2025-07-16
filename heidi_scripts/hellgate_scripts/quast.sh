#!/bin/bash

#SBATCH --job-name=quast
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --mem-per-cpu=16

CONTAINER_PATH=~/bin/
fasta=$1
outdir=$2

apptainer exec --bind /scratch/$USER/ $CONTAINER_PATH/quast.sif quast.py ${fasta} -o ${outdir} -t 16
