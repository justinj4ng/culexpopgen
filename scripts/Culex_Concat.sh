#!/bin/bash
#SBATCH --partition=day
#SBATCH --job-name=Culex_Concat_25
#SBATCH -c 5
#SBATCH --time=1-00:00:00
#SBATCH --mem=48G 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=justin.jang@yale.edu


#paths

FASTA="/home/ag674/palmer_scratch/FASTA_Cx"

cat "$FASTA"/CxHM23_05_180_013_S2_L001_R1_001.fastq.gz "$FASTA"/CxHM23_05_S116_L003_R1_001.fastq.gz > "$FASTA"/Sample_CxHM23_05_R1.fastq.gz
cat "$FASTA"/CxHM23_05_180_013_S2_L001_R2_001.fastq.gz "$FASTA"/CxHM23_05_S116_L003_R2_001.fastq.gz > "$FASTA"/Sample_CxHM23_05_R2.fastq.gz
 
cat "$FASTA"/CxHM23_10_144_049_S5_L001_R1_001.fastq.gz "$FASTA"/CxHM23_10_S115_L003_R1_001.fastq.gz > "$FASTA"/CxHM23_10_R1.fastq.gz
cat "$FASTA"/CxHM23_10_144_049_S5_L001_R2_001.fastq.gz "$FASTA"/CxHM23_10_S115_L003_R2_001.fastq.gz > "$FASTA"/CxHM23_10_R2.fastq.gz

cat "$FASTA"/CxHM23_13_120_073_S7_L001_R1_001.fastq.gz "$FASTA"/CxHM23_13_S117_L003_R1_001.fastq.gz > "$FASTA"/CxHM23_13_R1.fastq.gz
cat "$FASTA"/CxHM23_13_120_073_S7_L001_R2_001.fastq.gz "$FASTA"/CxHM23_13_S117_L003_R2_001.fastq.gz > "$FASTA"/CxHM23_13_R2.fastq.gz

cat "$FASTA"/RICME_01_177_016_S7_L006_R1_001.fastq.gz "$FASTA"/RICME_01_S113_L003_R1_001.fastq.gz > "$FASTA"/RICME_01_R1.fastq.gz
cat "$FASTA"/RICME_01_177_016_S7_L006_R2_001.fastq.gz "$FASTA"/RICME_01_S113_L003_R2_001.fastq.gz > "$FASTA"/RICME_01_R2.fastq.gz

cat "$FASTA"/RICME_10_105_088_S13_L006_R1_001.fastq.gz "$FASTA"/RICME_10_S114_L003_R1_001.fastq.gz > "$FASTA"/RICME_10_R1.fastq.gz
cat "$FASTA"/RICME_10_105_088_S13_L006_R2_001.fastq.gz "$FASTA"/RICME_10_S114_L003_R2_001.fastq.gz > "$FASTA"/RICME_10_R2.fastq.gz

cat "$FASTA"/RICME_17_145_048_S36_L002_R1_001.fastq.gz "$FASTA"/RICME_17_B22G3TJLT4_L002_R1_001.fastq.gz > "$FASTA"/RICME_17_R1.fastq.gz
cat "$FASTA"/RICME_17_145_048_S36_L002_R2_001.fastq.gz "$FASTA"/RICME_17_B22G3TJLT4_L002_R2_001.fastq.gz > "$FASTA"/RICME_17_R2.fastq.gz
