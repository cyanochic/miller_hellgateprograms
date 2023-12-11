# Installing PGAP from NCBI
Generally, it seems that PGAP is not written well for use in managed HPC environments, particularly those using a job scheduler like SLURM and Singularity (here, apptainer). Installing was a bit of a mess, but using the following resources, I managed to get it to work.


### Resources Used
- [NCBI PGAP Quick Start](https://github.com/ncbi/pgap/wiki/Quick-Start)
- [Bioinformatics Workbook PGAP Tutorial](https://bioinformaticsworkbook.org/dataAnalysis/GenomeAnnotation/PGAP_tutorial.html)
- [NCBI PGAP GitHub Issue #202](https://github.com/ncbi/pgap/issues/202)
- [NCBI PGAP Webinar/Video Tutorial](https://www.youtube.com/watch?v=pNn_-_46lpI)


### Installation Instructions
1. Move to scratch directory
   
2. Start an interactive session
`srun --time=60 --nodes=1 --cpus-per-task=2 --mem=86 --pty bash -i`

3. Download pgap.py script and put it in scratch directory
	`curl -OL https://github.com/ncbi/pgap/raw/prod/scripts/pgap.py`

4. Export path so that pgap doesn't try to install in home directory (database is too large to be installed in home/netID)
`export PGAP_INPUT_DIR=/scratch/netID/`

5. Give pgap.py permissions.
`chmod +x ./pgap.py`

6. Run and update the pgap.py program. This will install the required databases and create a .sif file. NOTE: for whatever reason I cannot get it to create a sif file that is with the container name provided, it just makes its own sif file with a version/build date in the name.
`./pgap.py --container-name pgap.sif -D singularity --update`

7. **SUPER IMPORTANT EXTRA STEP:** pgap.py uses a command called `taskset` which independently picks cpus/nodes from SLURM/job scheduler. **To properly run pgap.py, this needs to be commented out.** This should be **lines 195 and 196**. Whenever running after this, you NEED to add the flag --no-self-update! Or else it will try to update again.


### Additional Notes on Running after Install

In sbatch script, you must REEXPORT PATH! Why? No idea, but it will try to reinstall program in home directory if you don't. Essentially, the code in step 4 will need to be put into your job script.
