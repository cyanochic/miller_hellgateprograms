## Installed using staphb docker images

General code: `apptainer pull <program>.sif docker://staphb/<program>`

- spades `apptainer pull spades.sif docker://staphb/spades`
  
- fastqc `apptainer pull fastqc.sif docker://staphb/fastqc`
  
- samtools  `apptainer pull samtools.sif docker://staphb/samtools`
  
- bwa `apptainer pull bwa.sif docker://staphb/bwa`
  
- IQtree2 `apptainer pull iqtree2.sif docker://staphb/iqtree2`
  
- RAxML `apptainer pull raxml.sif docker://staphb/raxml`
  
- Roary `apptainer pull roary.sif docker://staphb/roary`
  
- Quast `apptainer pull quast.sif docker://staphb/quast`
  
- BBtools `apptainer pull bbtools.sif docker://staphb/bbtools`
  
- Bowtie2 `apptainer pull bowtie2.sif docker://staphb/bowtie2` - NOTE: got a bunch of "warn rootless" things when creating this container? idk what it means or if it's bad
  
- trimmomatic `apptainer pull trimmomatic.sif docker://staphb/trimmomatic`
  
- PROKKA `apptainer pull prokka.sif docker://staphb/prokka`
  
- bedtools `apptainer pull bedtools.sif docker://staphb/bedtools`

## Installed using biocontainers docker images

- htseq `apptainer pull htseq.sif docker://biocontainers/htseq:v0.11.2-1-deb-py3_cv1`

- sortmeRNA `apptainer pull sortmerna.sif docker://biocontainers/sortmerna:v2.1-3-deb_cv1`
 

## Other prebuilt containers
- orthofinder `apptainer pull orthofinder.sif docker://davidemms/orthofinder`
  
- BLAST `apptainer pull blast.sif docker://ncbi/blast`
  
- EukRep `apptainer pull eukrep.sif docker://sonnenburglab/eukrep`
  
- Flash2 `apptainer pull flash2.sif docker://jsaydo/flash2:v2.2.00`
  
- ANVIO `apptainer pull anvio.sif docker://meren/anvio:latest`
  
