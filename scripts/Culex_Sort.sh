#!/bin/bash
#SBATCH --partition=week
#SBATCH --job-name=Culex_sort
#SBATCH -c 4
#SBATCH --time=6-00:00:00
#SBATCH --mem=12G 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=andrea.gloria-soria@yale.edu

#paths

module load SAMtools/1.21-GCC-12.2.0

MAP="/gpfs/gibbs/pi/powell/Culex_ngs/PopGen/Processed_AGS/Cx_mapped"
SORTED="/home/ag674/palmer_scratch/Cx_sortedBAM"

samtools sort -@ 4 -m 2G "$MAP"/ANAST_02.bam -o	"$SORTED"/ANAST_02.sorted.bam	
samtools sort -@ 4 -m 2G "$MAP"/ANAST_03.bam -o	"$SORTED"/ANAST_03.sorted.bam
samtools sort -@ 4 -m 2G "$MAP"/ANAST_06.bam -o	"$SORTED"/ANAST_06.sorted.bam
samtools sort -@ 4 -m 2G "$MAP"/ANAST_08.bam -o	"$SORTED"/ANAST_08.sorted.bam
samtools sort -@ 4 -m 2G "$MAP"/ANAST_11.bam -o	"$SORTED"/ANAST_11.sorted.bam
samtools sort -@ 4 -m 2G "$MAP"/ANAST_12.bam -o	"$SORTED"/ANAST_12.sorted.bam
