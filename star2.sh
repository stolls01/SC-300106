#!/bin/bash

#SBATCH --job-name=STAR2
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=12:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/stoll/logs/STAR2.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/stoll/logs/STAR2.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12030007@unet.univie.ac.at

# now the actual code comes without hashtag, the previous is just instructions for lisc segmentation

# set variable of our directory so we need to do less typing
# also to make the code more readable/comprehensible/less risk of mistyping
###ENVIRONMENT
module load STAR
module list
wDir="/lisc/data/scratch/course/2025w300106/stoll"

###EXECUTION
#align reads to our reference. first four are the minimum options.
#how many cpus to use, where the genome is in directory, the fastq in file,
# what the prefix of out files will be
# outSamstrandField: when we have found an intron (gap in read), we want to keep this information!! also allows joining of exons that belong together
# specify what sort of BAM file we create


###EXECUTION

STAR --runThreadN 16 --genomeDir $wDir/HLdesRot8A_STAR \
	--readFilesIn $wDir/results/trimmomatic/*1P $wDir/results/trimmomatic/*2P \
	--outFileNamePrefix $wDir/results/map/SRR36696742_trimmed_HldesRot8A_ \
	--outSAMstrandField intronMotif  --outSAMtype BAM SortedByCoordinate
