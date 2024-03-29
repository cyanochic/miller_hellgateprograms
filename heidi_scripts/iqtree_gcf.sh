#!/bin/bash

#SBATCH --job-name=iqtree
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

netID=ha127954 #your net ID
iqtree=~/bin/iqtree2.sif #iqtree2 container
concattree=$1
locitree=$2
prefix=$3


apptainer exec --bind /scratch/${netID}/ --bind /projects/${netID}/ ${iqtree} iqtree2 -t ${concattree} --gcf ${locitree} --prefix ${prefix}
