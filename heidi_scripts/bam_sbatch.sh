#!/bin/bash

#SBATCH --job-name=bam_creation
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --mem-per-cpu=64

CONTAINER_PATH=~/bin/
prefix=$1

~/bin/bam_illumina.sh ${prefix} ${prefix}_scaf_filtered.fasta /scratch/ha127954/sc4368/4368_${prefix}_R1.fastq.gz /scratch/ha127954/sc4368/4368_${prefix}_R2.fastq.gz 4368_${prefix}
