#!/bin/bash

#required user inputs
prefix=$1 #prefix to use for output files

apptainer exec --bind /projects/$USER/ --bind /scratch/$USER/ --bind ~/ ~/bin/prokka.sif prokka --cpus 0 --outdir /scratch/$USER/prokka/${prefix} --force /projects/$USER/genomesSB/${prefix}.fasta
