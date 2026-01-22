#!/bin/bash

#SBATCH --job-name=count2
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/stoll/logs/counts2.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/stoll/logs/counts2.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12030007@unet.univie.ac.at

# environment
module load Subread


# this time use the de novo "assembly".gtf we just created using stringtie

wd="/lisc/data/scratch/course/2025w300106/stoll"

# using -p for paired ends and count 1 read per template, and only primary alignments
# 4 cpus
featureCounts -p --countReadPairs -C -T 4 --primary -a $wd/results/filtered_stringtie_HldesRot8A.gtf \
	-o $wd/results/map/SRR36696742_feature_count.tsv \
	$wd/results/map/SRR36696742_filtered_trimmed_HldesRot8A_Aligned.sortedByCoord.out.bam

