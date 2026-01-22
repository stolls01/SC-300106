#!/bin/bash

#SBATCH --job-name=counts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/stoll/logs/counts.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/stoll/logs/counts.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12030007@unet.univie.ac.at

# environment
module load Subread

#execution
# use 4 cpus, using -p for paired ends
# count 1 read per template, and only primary alignments 
featureCounts -p --countReadPairs -C -T 4 --primary -a GCF_022682495.2_HLdesRot8A.1_genomic.gtf -o results/map/SRR36696742_feature_count.tsv results/map/SRR36696742_filtered_trimmed_HldesRot8A_Aligned.sortedByCoord.out.bam

