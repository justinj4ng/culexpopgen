#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=SAMcoverage
#SBATCH -c 1
#SBATCH --time=1-00:00:00
#SBATCH --mem=12G 
#SBATCH --error=BAMcoverage_%j.out
#SBATCH --output=BAMcoverage_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=andrea.gloria-soria@yale.edu

module load SAMtools/1.21-GCC-12.2.0

cd /home/ag674/palmer_scratch/Culex_CleanBAM/MAS_ORDER

for f in *above.bam; do
    echo "Processing $f"
    samtools coverage "$f" > "${f%.bam}.coverage.txt"
done