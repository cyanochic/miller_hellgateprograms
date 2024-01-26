#!/bin/bash

#SBATCH --job-name=filterblast
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=172G
#SBATCH --cpus-per-task=2

prefix=$1

netID=ha127954 #your net ID
blast=~/bin/blast.sif #blast container
quast=~/bin/quast.sif #quast container
#fwd=/scratch/ha127954/sc4368/4368_${prefix}_R1.fastq.gz #path to forward raw reads
#rvs=/scratch/ha127954/sc4368/4368_${prefix}_R2.fastq.gz #path to rvs raw reads
#output=/scratch/ha127954/4368_${prefix}_assembly/ #path to output directory
SBdb=/projects/ha127954/referenceGenomes/EgibBon17_SB.fasta
cpdb=/projects/ha127954/referenceGenomes/Egib17Bon1_cp.fasta
mtdb=/projects/ha127954/referenceGenomes/Egib17Bon1_mt.fasta

#egrep -o "NODE\_[[:digit:]]{1,}\_length\_[1-9][[:digit:]]{3,}\_cov\_[1-9][[:digit:]]{0,}\.[[:digit:]]{1,}" scaffolds.fasta > seqIDlist.txt

#apptainer exec --bind /scratch/${netID}/ ${blast} blastdbcmd -entry_batch seqIDlist.txt -db scaffolds.fasta -target_only -out ${prefix}_scaf_filtered.fasta

#apptainer exec --bind /scratch/${netID}/ ${quast} quast.py ${prefix}_scaf_filtered.fasta -o quast/

mkdir localblast/
#mkdir ${output}selectednodes/

##assumes reference blast genomes already have databases built with makeblastdb

apptainer exec --bind /scratch/${netID}/ --bind /projects/${netID}/ ${blast} blastn -db ${SBdb} -query ${prefix}_scaf_filtered.fasta -out localblast/${prefix}_blast_SB.txt -outfmt 6 -max_hsps 1

apptainer exec --bind /scratch/${netID}/ --bind /projects/${netID}/ ${blast} blastn -db ${cpdb} -query ${prefix}_scaf_filtered.fasta -out localblast/${prefix}_blast_cp.txt -outfmt 6 -max_hsps 1

apptainer exec --bind /scratch/${netID}/ --bind /projects/${netID}/ ${blast} blastn -db ${mtdb} -query ${prefix}_scaf_filtered.fasta -out localblast/${prefix}_blast_mt.txt -outfmt 6 -max_hsps 1

