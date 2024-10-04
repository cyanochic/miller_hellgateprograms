#!/bin/bash

#SBATCH --job-name=spades_assembly
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=500G

spades=~/bin/spades.sif #spades container
blast=~/bin/blast.sif #blast container

output=$1

apptainer exec --bind /scratch/$USER/ ${spades} spades.py --continue -o ${output}

##filter spades output for anything 1kb or longer with 1x or more coverage
egrep -o "NODE\_[[:digit:]]{1,}\_length\_[1-9][[:digit:]]{3,}\_cov\_[1-9][[:digit:]]{0,}\.[[:digit:]]{1,}" ${output}scaffolds.fasta > ${output}seqIDlist.txt

apptainer exec --bind /scratch/$USER/ ${blast} makeblastdb -in ${output}scaffolds.fasta -parse_seqids -dbtype nucl

apptainer exec --bind /scratch/$USER/ ${blast} blastdbcmd -entry_batch ${output}seqIDlist.txt -db ${output}scaffolds.fasta -target_only -out ${output}${prefix}_scaf_filtered.fasta
