#!/bin/bash

#SBATCH --job-name=iqtree
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

netID=ha127954 #your net ID
iqtree=~/bin/iqtree2.sif #iqtree2 container
align=$1
genes=$2
prefix=$3


apptainer exec --bind /scratch/${netID}/ --bind /projects/${netID}/ ${iqtree} iqtree2 -s ${align} -p ${genes} -B 1000 -alrt 1000 -m TEST -T AUTO --prefix ${prefix}
