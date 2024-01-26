#!/bin/bash
#SBATCH --job-name=pgap_annotation
#SBATCH --nodes=2
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=64G


netID=ha127954 #CHANGE THIS TO YOUR NETID
containername=/scratch/ha127954/pgap_2023-10-03.build7061.sif #put path to your PGAP container
pgap=/scratch/ha127954/pgap.py #change to where you have pgap.py
outdir=$1
genome=$2
taxid=$3 #taxonomy name from NCBI, must be in single quotes

export PGAP_INPUT_DIR=/scratch/${netID}

/scratch/${netID}/pgap.py --no-self-update -o ${outdir} -g ${genome} -s ${taxid} -c 2 -r -D singularity --container-name ${containername}
