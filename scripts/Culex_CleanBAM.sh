#!/bin/bash
#SBATCH --partition=week
#SBATCH --job-name=Cx_cleanBAM
#SBATCH -c 4
#SBATCH --time=7-00:00:00
#SBATCH --mem=12G 
#SBATCH --mail-type=ALL
#SBATCH --mail-user=justin.jang@yale.edu

#paths

module load SAMtools/1.21-GCC-12.2.0


#REF="/gpfs/gibbs/pi/powell/genomes/Culex_pipiens/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4.fasta"
#INDIR="/home/ag674/palmer_scratch/Clean"
#OUTDIR="/home/ag674/palmer_scratch/MAS_ORDER"
#THREADS=4
#INPUT="${INDIR}/${SAMPLE}.sorted.bam"
#COLLATE="${OUTDIR}/${SAMPLE}_collate.bam"
#FIXMATE="${OUTDIR}/${SAMPLE}_fixmate.bam"
#ORDER="${OUTDIR}/${SAMPLE}_order.bam"
#DEDUP="${OUTDIR}/${SAMPLE}_dedup.bam"
#CLIPPED="${OUTDIR}/${SAMPLE}_clipped.bam"
#ABOVE="${OUTDIR}/${SAMPLE}_above.bam"
#STATS="${OUTDIR}/${SAMPLE}_stats.txt"

cd /home/ag674/palmer_scratch/

#SAMPLE="ANAST_02"; samtools collate -@ $THREADS -o "$COLLATE" --output-fmt BAM --reference "$REF" "$INPUT" && rm "$INPUT" && samtools fixmate -@ $THREADS -r -c -m --reference "$REF" --output-fmt BAM "$COLLATE" "$FIXMATE" && rm "$COLLATE" && samtools sort -m 2G -@ $THREADS --reference "$REF" -o "$ORDER" "$FIXMATE" && rm "$FIXMATE" && samtools markdup -r -s --write-index -f "$STATS" "$ORDER" "$DEDUP" && rm "$ORDER" && samtools view -h "$DEDUP" | awk 'length($10) > 29 || $1 ~ /^@/' | samtools view -@ $THREADS -bS - > "$CLIPPED" && rm "$DEDUP" && samtools view -h -b -q 10 -@ $THREADS "$CLIPPED" -o "$ABOVE" && rm "$CLIPPED" && samtools index -b -@ $THREADS "$ABOVE"


# Define the target directory
OUTBC="/home/ag674/palmer_scratch/Clean"

# Loop through files in the target directory
#NOTE: the unclassified folder will be thrown on the MAIN directory, since the barcode is NULL...

for f in "$OUTBC"/*.bam; do
    NAME="$f"
    SAMPLE=$(echo "$NAME" | cut -d '.' -f 1 | cut -d '/' -f 6)
    echo "$SAMPLE"
    REF="/gpfs/gibbs/pi/powell/genomes/Culex_pipiens/Cpip_assembly_3chrom_nodebris_gapclosed_Apr4.fasta"
	INDIR="/home/ag674/palmer_scratch/Clean"
	OUTDIR="/home/ag674/palmer_scratch/MAS_ORDER"
	THREADS=4
	INPUT="${INDIR}/${SAMPLE}.sorted.bam"
	COLLATE="${OUTDIR}/${SAMPLE}_collate.bam"
	FIXMATE="${OUTDIR}/${SAMPLE}_fixmate.bam"
	ORDER="${OUTDIR}/${SAMPLE}_order.bam"
	DEDUP="${OUTDIR}/${SAMPLE}_dedup.bam"
	CLIPPED="${OUTDIR}/${SAMPLE}_clipped.bam"
	ABOVE="${OUTDIR}/${SAMPLE}_above.bam"
	STATS="${OUTDIR}/${SAMPLE}_stats.txt"
samtools collate -@ $THREADS -o "$COLLATE" --output-fmt BAM --reference "$REF" "$INPUT" && rm "$INPUT" && samtools fixmate -@ $THREADS -r -c -m --reference "$REF" --output-fmt BAM "$COLLATE" "$FIXMATE" && rm "$COLLATE" && samtools sort -m 2G -@ $THREADS --reference "$REF" -o "$ORDER" "$FIXMATE" && rm "$FIXMATE" && samtools markdup -r -s --write-index -f "$STATS" "$ORDER" "$DEDUP" && rm "$ORDER" && samtools view -h "$DEDUP" | awk 'length($10) > 29 || $1 ~ /^@/' | samtools view -@ $THREADS -bS - > "$CLIPPED" && rm "$DEDUP" && samtools view -h -b -q 10 -@ $THREADS "$CLIPPED" -o "$ABOVE" && rm "$CLIPPED" && samtools index -b -@ $THREADS "$ABOVE"

done

