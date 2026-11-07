100%
#Culex WGS. Analysis using the latest genome assembly.

#to make things easier, I temporarily copied all files to the scratch folder

All the scripts you need are right now in a temporal folder in my dropbox, please download and let me know when you have them, so I can delete.

The new fastq files received and that you should process are below, and you should be able to access them from any cluster. If that doesn't work, I can send you the original email. Note that I also have a copy in my cluster folder:

/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_01
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_02
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_03
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_04
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_08
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_09
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_11
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_13
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_14
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_15
/ycga-gpfs/sequencers/illumina/sequencerX/runs/20261030_LH00309_0627_B23VN2GLT4/Data/Intensities/BaseCalls/Unaligned-150-2/Project_Ag674/Sample_CxqTX_17


##IMPORTANT## Make sure to change PATHS so that you do not write over my files please. Also, modify script headers with your info.

##Concatenate files with two runs (only if the same sample ran more than once in the sequencer and produced two independent fastq files per read pair)

script: Culex_Concat.sh

##FASTP PROCESSING

* when running the entire database +100 samples, I had to split the samples into smaller batches because week partition is taking long.

script: Culex_FastP.sh   but...

*using a batch script provided by developers of FastP: script: Culex_FastP_batch.sh (note that cluster waiting time in week partition is usually long)

module load Python/3.12.3-GCCcore-13.3.0
python parallel.py -h 

##Map reads with Bowtie2

#index reference genome (script: Culex_IndexAss.sh)

#map; mapping local to improve mapping quality. NOTE: the reference genome PATH points to the right location, no need to change that one.

script: TempBW1L.sh


##sort bam

script: Culex_Sort.sh > sorted in same fragments as mapping, to save time 

##index bams.

script: Culex_Index.sh 

##Clean duplicates (Dario script: Culex_CleanBAM.sh)

#Get coverage in samtools: Culex_SAMcoverage.sh

##mapping Quality - Qualimap. Request at least 15G RAM. NOTE: Not worth doing it as a batch. Only table is informative, the plots are not when you have a lot of samples.

salloc -t 4:00:00 --mem=8G  ##NOTE: needs to run in a script because it takes long...

module load miniconda

#                                                                                                                                            
# To activate this environment, use                                                                                                          
#                                                                                                                                            
#     $ conda activate qualimap_env                                                                                                          
#                                                                                                                                            
# To deactivate an active environment, use                                                                                                   
#                                                                                                                                            
#     $ conda deactivate  


conda activate qualimap_env  

#qualimap bamqc -bam /home/ag674/palmer_scratch/Cx_sortedBAM/ANAST_02.sorted.bam  -outdir /home/ag674/palmer_scratch/Cx_Qualimap -outformat PDF -ip -c -sd -sdmode 2 --java-mem-size=13G unset DISPLAY  


##Filter all BAMs for Mapping quality using Samtools view -h q 20.  #NOTE: Dario "clean" already filters by q10. 

##extract 3 chromosomes: script Culex_Chrom.sh
	#NOTE: seems that only chromosome 2 was extracted! somehow the mpileup got corrupted. If you ran into problems, do not extract the chromosomes at this stage. We will do it after variant calling, even if it takes longer.
	
	chromosome_2	219743616	2695982700	12.26876461339382	15.758875725134597
	chromosome_3	194021860	2112030932	10.885530795344401	14.345929749264702
	chromosome_1	126292736	1344263694	10.644030183968775	13.755280887437968

### 
### You can stop here, before calling the variants on the entire dataset. And we check if new samples are coming in anytime soon. Otherwise, we can proceed.
# To proceed, we will need to upload the rest of the processed BAMS back on the cluster.


##call variants: script ran in the long partition, because takes more than 7 days!!! Took 12 days: Culex_variantCall.sh

#index bcf: Culex_Index_BCF.sh
  
##contig=<ID=chromosome_2,length=219743616>
##contig=<ID=chromosome_3,length=194021860>
##contig=<ID=chromosome_1,length=126292736>

/home/ag674/palmer_scratch/Culex_CleanBAM/MAS_ORDER/ANAST_02_above.bam  #names in bcf are long...

##Filter for quality and depth (Q20 and depth either 2 or 5):  Culex_SNPfilter_QualDepth.sh
	
	##NOTE: it does not seem to make a big difference, so I will stick to DP2

##get stats with script Culex_statsVCF.sh #these .stats are not super useful, but the depth ones are...

##get mono and biallelic SNPs only: Culex_mono_biallel.sh

#rename  (new_names.txt = old_name	new_name)

bcftools reheader -s Culex_newNames.txt -o Culex_USA_May_2026.bcf_Q20DP2_BA_na.vcf.gz Culex_USA_May_2026.bcf_Q20DP2_BA.vcf.gz

#Rename

module load  BCFtools/1.21-GCC-13.3.0

bcftools reheader -s Culex_newNames.txt -o Culex_USA_May_2026_Q20DP2_BA_ID.vcf.gz Culex_USA_May_2026_Q20DP2_BA.vcf.gz


## missing data: Culex_miss.sh
	#NOTE: high percentage of missing data in some populations like COSTX and several UT
	
##Filter vcf to eliminate SNPs with more than 30% missing data with Culex_vcfFilter30.sh

#OR###   FYI may be better to use bcftools for this part... considering it.: Script : Culex_BCFFilter30.sh

#keep only East Coast

	#get sample "names"into a text file and edit: bcftools query -l Culex_USA_May_2026_Q20DP2_BA_ID.vcf.gz > EastCoast.txt
	
	#filter for East Coast only: Culex_bcf_EastCoast.sh  #note that filtering from vcf has issues...
		#kept 167 out of 281 Individuals
		
	
	
#convert to plink. Script: Culex_Plink.sh

module load VCFtools/0.1.17-GCC-13.3.0

vcftools --gzvcf Culex_EC_June_2026b.vcf.gz --plink --chrom-map Chr_plink.txt --out Culex_EC_June_2026b

#make bed 
plink --file Culex_EC_June_2026b --make-bed --allow-extra-chr --out Culex_EC_June_2026b

#Check for relatives: script Culex_relatives.sh

module load PLINK/2_avx2_20221024

#no relatives detected in old David's data, applying to my own analysis in script...  Script: Culex_relatives.sh

plink2 --bfile final_joint_call_merged_molestus_filtered_pruned --make-king triangle bin --allow-extra-chr --out final_joint_call_merged_molestus_filtered_pruned_rel

plink2 --bfile final_joint_call_merged_molestus_filtered_pruned --king-cutoff final_joint_call_merged_molestus_filtered_pruned_rel 0.0884 --allow-extra-chr --out final_joint_call_merged_molestus_filtered_pruned_nr


#Plink filter: Culex_plinkFilter.sh

- 51080818 variants, 167 people > 132 people remaining

#6455589 variants removed due to missing genotype data; --geno 0.10 

#3 people removed due to missing genotype (N=129); --mind 0.15

#25745497 variants removed due to minor allele threshold; --maf 0.05 

#LD filter and PCA : Culex_LDPCA.sh

Pruned 3818031 variants from chromosome 1, leaving 746568.
Pruned 6233447 variants from chromosome 2, leaving 1302836.
Pruned 5631513 variants from chromosome 3, leaving 1147337.
Pruning complete.  15682991 of 18879732 variants removed.

3196741 variants remaining

