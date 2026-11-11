#!/bin/bash
#SBATCH --partition=week
#SBATCH --job-name=chromBAM
#SBATCH -c 4
#SBATCH --time=7-00:00:00
#SBATCH --mem=8G 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=justin.jang@yale.edu


#@SQ	SN:chromosome_2	LN:219743616
#@SQ	SN:chromosome_3	LN:194021860
#@SQ	SN:chromosome_1	LN:126292736

cd /gpfs/gibbs/pi/powell/Culex_ngs/scripts_AGS

module load SAMtools/1.21-GCC-12.2.0

#paths
MAP="/home/ag674/palmer_scratch/MAS_ORDER"
CHROM="/home/ag674/palmer_scratch/Chromosomes"

samtools view -b -h "$MAP"/ANAST_02_above.bam  -L Chromosomes_Cx.bed > "$CHROM"/ANAST_02_Cpip29_Chrom.bam
samtools view -b -h "$MAP"/ANAST_03_above.bam  -L Chromosomes_Cx.bed > "$CHROM"/ANAST_03_Cpip29_Chrom.bam
samtools view -b -h "$MAP"/ANAST_06_above.bam  -L Chromosomes_Cx.bed > "$CHROM"/ANAST_06_Cpip29_Chrom.bam
samtools view -b -h "$MAP"/ANAST_08_above.bam  -L Chromosomes_Cx.bed > "$CHROM"/ANAST_08_Cpip29_Chrom.bam
samtools view -b -h "$MAP"/ANAST_11_above.bam  -L Chromosomes_Cx.bed > "$CHROM"/ANAST_11_Cpip29_Chrom.bam
samtools view -b -h "$MAP"/ANAST_12_above.bam  -L Chromosomes_Cx.bed > "$CHROM"/ANAST_12_Cpip29_Chrom.bam
