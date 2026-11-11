#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=Cx_indexBAM
#SBATCH -c 4
#SBATCH --time=2:00:00
#SBATCH --mem=12G 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=justin.jang@yale.edu

#paths

module load SAMtools/1.21-GCC-12.2.0

MAP="/home/ag674/palmer_scratch/Cx_sortedBAM"

samtools index "$MAP"/ANAST_02.sorted.bam
samtools index "$MAP"/ANAST_03.sorted.bam
samtools index "$MAP"/ANAST_06.sorted.bam
samtools index "$MAP"/ANAST_08.sorted.bam
samtools index "$MAP"/ANAST_11.sorted.bam
samtools index "$MAP"/ANAST_12.sorted.bam
samtools index "$MAP"/ANAST_13.sorted.bam
samtools index "$MAP"/ANAST_14.sorted.bam
samtools index "$MAP"/ANAST_15.sorted.bam
samtools index "$MAP"/ANAST_16.sorted.bam
samtools index "$MAP"/ANAST_19.sorted.bam
