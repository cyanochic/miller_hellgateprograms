#!/bin/bash

#SBATCH --job-name=bam_creation
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --mem-per-cpu=64

CONTAINER_PATH=~/bin/
prefix=$1
fasta=$2
fwd=$3
rvs=$4

~/scripts/bam_illumina.sh ${prefix} ${fasta} ${fwd} ${rvs} ${prefix}
