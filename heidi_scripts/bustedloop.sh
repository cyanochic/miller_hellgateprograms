#!/bin/bash

#user inputs/things you can change
INDIR=nogaps #directory of all the gene alignments you want to run busted on
RESULTSDIR=results #directory for json files to end up because I can't get their --output flag to work
LOGDIR=logs #directory for busted "stdout" files to go

#setup stuff
mkdir tmp

#get list of files for for loop to work
ls $INDIR > tmp/files.txt
#remove the .faa so able to work with things in the for loop later
sed -i 's/\.phy*//g' tmp/files.txt

#set infile for alignment for loop
INFILE=tmp/files.txt

IFS=$'\n' #sets internal file separator to a new line (e.g. each for loop will take the next line)
for LINE in $(cat "$INFILE")
do

	exec &>> $LOGDIR/$LINE.log #sends standard out to a log file

	hyphy busted --alignment $INDIR/$LINE.phy --tree paml.tree

	mv $INDIR/$LINE.phy.BUSTED.json $RESULTSDIR #moves output file to logs folder

done