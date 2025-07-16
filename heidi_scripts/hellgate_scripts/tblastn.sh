#!/bin/bash

#SBATCH --job-name=tblastn
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem=96G
#SBATCH --cpus-per-task=24
#SBATCH --partition="cpu(all)"

db=$1
query=$2
output=$3

blast=~/bin/blast.sif #blast container


##assumes reference blast genomes already have databases built with makeblastdb

apptainer exec --bind /scratch/$USER/ --bind /projects/$USER/ ${blast} tblastn -db ${1} -query ${2} -out ${3} -outfmt 6 -max_hsps 1 -max_target_seqs 10000 -evalue 1 -num_threads 24
