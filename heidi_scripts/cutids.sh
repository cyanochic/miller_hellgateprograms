#!/bin/bash

#user inputs/things you can change
INDIR=nogaps

#setup stuff
mkdir tmp

#get list of files for for loop to work
ls $INDIR > tmp/files.txt
#remove the .faa so able to work with things in the for loop later
sed -i 's/\.aln\.faa*//g' tmp/files.txt

#set infile for alignment for loop
INFILE=tmp/files.txt

IFS=$'\n' #sets internal file separator to a new line (e.g. each for loop will take the next line)
for LINE in $(cat "$INFILE")
do

	sed -i 's/_.*$//g' nogaps/$LINE
	
done