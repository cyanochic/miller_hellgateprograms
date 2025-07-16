#!/bin/bash

#SBATCH --job-name=eggnog_annotation
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

eggnog=~/bin/eggnog.sif #path to eggnog container

#required user inputs
input=$1 #input .faa file
prefix=$2 #prefix for output files

apptainer exec --bind /projects/$USER/ --bind /scratch/$USER/ $eggnog emapper.py -i ${input} -o ${prefix} --cpu 0 --dbmem --pident 40 --score 60 --query_cover 20 --subject_cover 20 --pfam_realign none --report_orthologs --decorate_gff yes --excel
