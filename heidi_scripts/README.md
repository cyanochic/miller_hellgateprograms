# Scripts written by Heidi

NOTE: all of these scripts are taken directly from how I've used them on Hellgate or my own computer, so information will likely need to be changed to properly run for you!

For sbatch scripts, I use apptainer so you may need to update accordingly. Generally, all of the scripts assume any .sif containers are within the directory `~/bin/` and `$USER` outputs the correct netID.

ALSO, not all scripts have been updated since hellgate switched to the beegfs system, so you'll want to double check any directory paths (especially with `apptainer --bind`) are correct.
