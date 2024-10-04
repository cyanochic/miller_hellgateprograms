#!/bin/bash

#SBATCH --job-name=iqtree
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

iqtree=~/bin/iqtree2.sif #iqtree2 container
align=$1 #with IQtree2 I think this will take either a file (e.g. SpeciesTreeAlignment.fa) or a directory of fasta files of individual gene alignments? Seems like there's a preference for using a partitioning .nex file to do this
prefix=$2


apptainer exec --bind /scratch/$USER/ --bind /projects/$USER/  ${iqtree} iqtree2 -s ${align} -B 1000 -alrt 1000 -m TEST --prefix ${prefix} -T AUTO -nt AUTO
