#!/bin/bash

#SBATCH --job-name=bam_creation
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --mem-per-cpu=32

CONTAINER_PATH=~/bin/

apptainer exec --bind /scratch/ha127954 $CONTAINER_PATH/fastqc.sif fastqc *.fastq.gz
