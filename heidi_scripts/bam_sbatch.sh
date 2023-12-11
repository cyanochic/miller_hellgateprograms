#!/bin/bash

#SBATCH --job-name=bam_creation
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --mem-per-cpu=64

PREFIX=$1 #prefix to use for bwa
REFSEQ=$2 #path to reference sequence (must be .fasta)
FWD=$3 #path to forward reads .fastq (or .fastq.gz)
RVS=$4 #path to reverse reads .fastq
FILENAME=$5 #prefix name for all outputs


~/bin/bam_illumina_inprogress.sh PREFIX REFSEQ FWD RVS FILENAME