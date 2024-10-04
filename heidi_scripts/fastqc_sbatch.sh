#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --mem-per-cpu=32

CONTAINER_PATH=~/bin/

apptainer exec --bind /scratch/$USER/ --bind /projects/$USER/ $CONTAINER_PATH/fastqc.sif fastqc *.fastq.gz
