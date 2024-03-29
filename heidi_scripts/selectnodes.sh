#!/bin/bash

#SBATCH --job-name=selectnodes
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96

prefix=$1

netID=ha127954 #your net ID
blast=~/bin/blast.sif #blast container
quast=~/bin/quast.sif #quast container

apptainer exec --bind /scratch/${netID}/ ${blast} blastdbcmd -entry_batch localblast/${prefix}_SB_seqIDs.txt -db scaffolds.fasta -target_only -out selectednodes/${prefix}_SB_chr.fasta

mkdir SBquast/
apptainer exec --bind /scratch/${netID}/ ${quast} quast.py selectednodes/${prefix}_SB_chr.fasta -o SBquast/
