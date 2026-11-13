#!/bin/bash
#SBATCH -J cx_map
#SBATCH --array=1-11
#SBATCH --output=slurm-%A.%a.out
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=4G
#SBATCH -t 12:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=justinjang@yale.edu

module reset
sample=$(sed -n "${SLURM_ARRAY_TASK_ID}p" samples.txt)
echo "Processing ${sample}"