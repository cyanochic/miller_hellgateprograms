#!/bin/bash

#SBATCH --job-name=spades_assembly
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=500G

netID=ha127954 #your net ID
spades=~/bin/spades.sif #spades container
blast=~/bin/blast.sif #blast container
quast=~/bin/quast.sif #quast container
fwd=$1
rvs=$2
prefix=$3
output=$4

apptainer exec --bind /scratch/${netID}/ ${spades} spades.py -1 ${fwd} -2 ${rvs} --meta -o ${output} -t 48 -m 500

##filter spades output for anything 1kb or longer with 1x or more coverage
egrep -o "NODE\_[[:digit:]]{1,}\_length\_[1-9][[:digit:]]{3,}\_cov\_[1-9][[:digit:]]{0,}\.[[:digit:]]{1,}" ${output}scaffolds.fasta > ${output}seqIDlist.txt

apptainer exec --bind /scratch/${netID}/ ${blast} makeblastdb -in ${output}scaffolds.fasta -parse_seqids -dbtype nucl

apptainer exec --bind /scratch/${netID}/ ${blast} blastdbcmd -entry_batch ${output}seqIDlist.txt -db ${output}scaffolds.fasta -target_only -out ${output}${prefix}_scaf_filtered.fasta
