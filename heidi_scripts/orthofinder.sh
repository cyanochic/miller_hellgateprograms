#!/bin/bash

#SBATCH --job-name=iqtree
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

netID=ha127954 #your net ID
iqtree=~/bin/iqtree.sif #iqtree container


apptainer exec --bind /scratch/${netID}/ --bind /projects/${netID}/  ${orthofinder} orthofinder -f $1 -M msa -oa -n ${prefix} -o ${output}