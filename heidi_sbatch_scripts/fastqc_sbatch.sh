#!/bin/bash

#SBATCH --job-name=bam_creation
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --mem-per-cpu=32

netID=yourNetID
CONTAINER_PATH=~/bin/

apptainer exec --bind /scratch/netID $CONTAINER_PATH/fastqc.sif fastqc *.fastq.gz
