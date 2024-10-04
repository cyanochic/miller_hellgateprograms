#!/bin/bash

#SBATCH --job-name=iqtree
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

iqtree=~/bin/iqtree2.sif #iqtree2 container
align=$1
genes=$2
prefix=$3


apptainer exec --bind /scratch/$USER/ --bind /projects/$USER/ ${iqtree} iqtree2 -s ${align} -S ${genes} -B 1000 -alrt 1000 -m TEST -T AUTO --prefix ${prefix}
