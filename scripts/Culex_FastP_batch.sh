#!/bin/bash
#SBATCH --partition=week
#SBATCH --job-name=batch_FastP
#SBATCH -c 5
#SBATCH --time=6-00:00:00
#SBATCH --mem=48G 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=justin.jang@yale.edu


module load fastp/0.23.2-GCCcore-10.2.0
module load Python/3.12.3-GCCcore-13.3.0

#modified
#python parallel.py -i /home/ag674/palmer_scratch/FASTA_Cx -o /home/ag674/palmer_scratch/FASTP_batch -r FASTP_report -a '--detect_adapter_for_pe	--umi 	--umi_loc=read1	--umi_len=10 	--umi_prefix=UMI	--dedup -z 4 	--trim_poly_g	--trim_poly_x'

python parallel.py -i /home/ag674/palmer_scratch/FASTA_Cx -o /home/ag674/palmer_scratch/FASTP_batch -r /home/ag674/palmer_scratch/FASTP_report -a '--detect_adapter_for_pe		--adapter_fasta adapters.fasta  	--low_complexity_filter  	--correction -f 5 -F 5 -t 5 -T 5  	--trim_poly_g  	--poly_g_min_len 5  	--trim_poly_x  	--poly_x_min_len 5  	--dedup -w 6 -z 4'
