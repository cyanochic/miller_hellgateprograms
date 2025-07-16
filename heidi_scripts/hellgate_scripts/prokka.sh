#!/bin/bash

#SBATCH --job-name=prokka_annotation
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

prokka=~/bin/prokka.sif #path to prokka container
#proteins=/projects/$USER/referenceGenomes/RoriPCC8801.gb #path to priority reference genome annotation to keep similar gene IDs -COMMENTED OUT, MIGHT RE ADD LATER, INCLUDE --proteins ${proteins} in script if add back in

#required user inputs
outdir=$1 #output directory
prefix=$2 #prefix to use for output files
input=$3 #input .fasta file

apptainer exec --bind /projects/$USER/ --bind /scratch/$USER/ --bind ~/ ${prokka} prokka --cpus 0 --outdir ${outdir} --force ${input}
