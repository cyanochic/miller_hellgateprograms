#!/bin/bash

#SBATCH --job-name=fastani
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

fastani=~/bin/fastani.sif #fastani container
query=$1
reference=$2
output=$3

apptainer exec --bind /scratch/$USER/ --bind /projects/$USER/ ${fastani} fastANI --ql ${query} --rl ${reference} -o ${output} --matrix
