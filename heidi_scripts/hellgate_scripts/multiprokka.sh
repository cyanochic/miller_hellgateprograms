#!/bin/bash

#SBATCH --job-name=prokka_annotation
#SBATCH --partition="cpu(all)"
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=24
#SBATCH --mem=96G

#required user inputs

INFILE=$1

IFS=$'\n' #sets internal file separator to a new line (e.g. each for loop will take the next line)
for LINE in $(cat "$INFILE")
do
  prokka_cmd.sh $LINE
done
