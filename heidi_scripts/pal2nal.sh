#!/bin/bash

#this line saves anything that went to stdout (terminal) into a logfile defined by you
exec &>> logs/pal2nal_nogap.log

#user inputs/things you can change
INDIR=alignments #should be a directory with files that all end in ".faa"! 
OUTDIR=nogaps #name of output directory
NUCDIR=cds #directory of corresponding nucleotide sequences for input protein alignments
OUTFMT=paml #output format (clustal|paml|fasta|codon)

#setup stuff
mkdir tmp
mkdir $OUTDIR

#get list of files for for loop to work
ls $INDIR > tmp/files.txt
#remove the .faa so able to work with things in the for loop later
sed -i 's/\.aln\.faa*//g' tmp/files.txt

#set infile for alignment for loop
INFILE=tmp/files.txt

IFS=$'\n' #sets internal file separator to a new line (e.g. each for loop will take the next line)
for LINE in $(cat "$INFILE")
do

	pal2nal.pl  $INDIR/$LINE.aln.faa  $NUCDIR/$LINE.ffn  -output $OUTFMT -nogap > $OUTDIR/$LINE.phy
	
done