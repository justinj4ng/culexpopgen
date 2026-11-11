#!/bin/bash
#SBATCH --partition=week
#SBATCH --job-name=18JanCulex01L_Bowtie2
#SBATCH -c 4
#SBATCH --time=7-00:00:00
#SBATCH --mem=48G 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=justin.jang@yale.edu


module load Bowtie2/2.4.2-GCCcore-10.2.0 SAMtools/1.16-GCCcore-10.2.0

#paths

MAPPED="/home/ag674/palmer_scratch/Cx_mapped"
FASTP="/home/ag674/palmer_scratch/FASTP2_Cx"
REF="/gpfs/gibbs/pi/powell/genomes/Culex_pipiens/"

bowtie2 -p $SLURM_CPUS_PER_TASK$ --local -x "$REF"/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4  -1 	"$FASTP"/ANAST_02_R1.fastq.gz	-2	"$FASTP"/ANAST_02_R2.fastq.gz	| samtools view -hb -o 	"$MAPPED"/ANAST_02_nr.bam	
bowtie2 -p $SLURM_CPUS_PER_TASK$ --local -x "$REF"/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4  -1 	"$FASTP"/ANAST_03_R1.fastq.gz	-2	"$FASTP"/ANAST_03_R2.fastq.gz	| samtools view -hb -o 	"$MAPPED"/ANAST_03_nr.bam	
bowtie2 -p $SLURM_CPUS_PER_TASK$ --local -x "$REF"/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4  -1 	"$FASTP"/ANAST_06_R1.fastq.gz	-2	"$FASTP"/ANAST_06_R2.fastq.gz	| samtools view -hb -o 	"$MAPPED"/ANAST_06_nr.bam	
bowtie2 -p $SLURM_CPUS_PER_TASK$ --local -x "$REF"/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4  -1 	"$FASTP"/ANAST_08_R1.fastq.gz	-2	"$FASTP"/ANAST_08_R2.fastq.gz	| samtools view -hb -o 	"$MAPPED"/ANAST_08_nr.bam	
bowtie2 -p $SLURM_CPUS_PER_TASK$ --local -x "$REF"/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4  -1 	"$FASTP"/ANAST_11_R1.fastq.gz	-2	"$FASTP"/ANAST_11_R2.fastq.gz	| samtools view -hb -o 	"$MAPPED"/ANAST_11_nr.bam	
bowtie2 -p $SLURM_CPUS_PER_TASK$ --local -x "$REF"/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4  -1 	"$FASTP"/ANAST_12_R1.fastq.gz	-2	"$FASTP"/ANAST_12_R2.fastq.gz	| samtools view -hb -o 	"$MAPPED"/ANAST_12_nr.bam	
