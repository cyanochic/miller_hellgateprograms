#!/bin/bash
#this line saves anything that went to stdout (terminal) into a logfile defined by you
exec &>> muscle.log

#required user inputs
INDIR=prot #should be a directory with files that all end in ".faa"! 
OUTDIR=alignments
muscle=./muscle-linux-x86.v5.3

#setup stuff
mkdir tmp #make temp directory
mkdir $OUTDIR #make output directory

#make file for for loop to work
#get list of files
ls $INDIR > tmp/files.txt
#remove the .faa so able to work with things in the for loop later
sed -i 's/\.faa*//g' tmp/files.txt

#set infile for alignment for loop
INFILE=tmp/files.txt

IFS=$'\n' #sets internal file separator to a new line (e.g. each for loop will take the next line)
for LINE in $(cat "$INFILE")
do
  $muscle -align $INDIR/$LINE.faa -output $OUTDIR/$LINE.aln.faa
done

#cleanup remove temp files
rm -r tmp/