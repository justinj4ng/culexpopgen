#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=index_ass
#SBATCH -c 4
#SBATCH --time=1-00:00:00
#SBATCH --mem=8G 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=justin.jang@yale.edu


module load Bowtie2/2.5.1-GCC-12.2.0

bowtie2-build /gpfs/gibbs/pi/powell/genomes/Culex_pipiens/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4.fasta /gpfs/gibbs/pi/powell/genomes/Culex_pipiens/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4
