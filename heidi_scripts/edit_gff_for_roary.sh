#!/bin/bash

#inputs
prefix=$1
# prokka_gff=$2 #include full path to gff file
# pseudo_gff=$3 #include full path to gff file
# finaldest=$4 #path to final destination output

#make and enter working directory and include files
mkdir ${prefix}_temp/

#copy files over to working temp directory
cat ./prokka_raw_gff/${prefix}.gff > ./${prefix}_temp/${prefix}_prokka.gff
cat ./pseudos_gff/${prefix}_pseudos.gff > ./${prefix}_temp/${prefix}_pseudos.gff

#enter temp directory
cd ./${prefix}_temp/

#code to cut out all the old_locus_tags from pseudofinder output
awk -F"old_locus_tag=" '/old_locus_tag=/{print $2}' ${prefix}_pseudos.gff | sed 's/\,/\n/g' > ${prefix}_old_locus_tags.txt
sed -i '/ign/d' ${prefix}_old_locus_tags.txt #removes any intergenic regions (bc intergenic regions not defined in prokka outputs)

# delete any line in prokka output that contains the old_locus_tag pattern (I can't believe I figured this out anad that it was this simple the whole time)
grep -v -f ${prefix}_old_locus_tags.txt ${prefix}_prokka.gff > ${prefix}_roary.gff


# summarizing output
wcl_init=$(wc -l ${prefix}_prokka.gff | awk '{print $1}')
wcl_olt=$(wc -l ${prefix}_old_locus_tags.txt | awk '{print $1}')
wcl_final=$(wc -l ${prefix}_roary.gff | awk '{print $1}')
wcl_rm=$((wcl_init - wcl_final))

echo "${prefix} started with ${wcl_init} lines. There were ${wcl_olt} ORFs identified as pseudogenes with pseudofinder. ${wcl_rm} lines were removed from the PROKKA gff file and ${wcl_final} lines remain."

# move file to final resting pl
cp ${prefix}_roary.gff ../gff

# remove temp files
cd ../ 
rm -r ./${prefix}_temp/