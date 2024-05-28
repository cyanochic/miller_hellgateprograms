#!/bin/bash

#programs
#bwa version 0.7.17-r1188
#samtools version 1.18

#apptainer commands
APPTAINER="apptainer exec --bind /scratch/ha127954"
BWA=~/bin/bwa.sif
SAMTOOLS=~/bin/samtools.sif

#INPUTS
PREFIX=$1 #prefix to use for bwa
REFSEQ=$2 #path to reference sequence (must be .fasta)
FWD=$3 #path to forward reads .fastq
RVS=$4 #path to reverse reads .fastq
FILENAME=$5 #name for all outputs


#INDEX CONTIGS/GENOME
$APPTAINER $BWA bwa index -p ${PREFIX} -a bwtsw ${REFSEQ}

#ALIGN PAIRED END READS
#apptainer exec --bind /scratch/ha127954/ ~/bin/bwa.sif bwa aln -t 16 ${PREFIX} ${FWD} > R1.bwa
#apptainer exec --bind /scratch/ha127954/ ~/bin/bwa.sif bwa aln -t 16 ${PREFIX} ${RVS} > R2.bwa
#COMMENTED OUT BECAUSE IM PRETTY SURE NEWER VERSION OF BWA SUPPOSED TO USE MEM INSTEAD OF ALN? WELL SEE

#align using bwa-mem algorithm
$APPTAINER $BWA bwa mem -t 16 ${PREFIX} ${FWD} ${RVS} -o ${FILENAME}.sam

#samtools convert sam to bam
$APPTAINER $SAMTOOLS samtools view -b -T ${REFSEQ} -o ${FILENAME}.bam ${FILENAME}.sam 

#sort bam
$APPTAINER $SAMTOOLS samtools sort ${FILENAME}.bam -o ${FILENAME}.srt.bam

#index bam
$APPTAINER $SAMTOOLS samtools index -b -o ${FILENAME}.srt.bam.bai ${FILENAME}.srt.bam

#useful stats
$APPTAINER $SAMTOOLS samtools idxstats ${FILENAME}.srt.bam > ${FILENAME}_idxstats.txt
