#!/bin/bash

#SBATCH --job-name=STAR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=30G
#SBATCH --time=12:00:00

#SBATCH --output=/lisc/data/scratch/course/2025w300106/stoll/logs/STAR.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/stoll/logs/STAR.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12030007@unet.univie.ac.at

# now the actual code comes, the previous is just instructions for lisc segmentation

#set up modules
###ENVIRONMENT
module load STAR
module list

###EXECUTION
#align reads to our reference. first four are the minimum options.
#how many cpus to use, where the genome is in directory, the fastq in file,
# what the out files will be called 
# outSamstrandField: when we have found an intron (gap in read), we want to keep this information!! also allows joining of exons that belong together
# specify what sort of BAM file we create
STAR --runThreadN 16 --genomeDir /lisc/data/scratch/course/2025w300106/stoll/HLdesRot8A_STAR --readFilesIn /lisc/data/scratch/course/2025w300106/stoll/SRR36696742_1.fastq /lisc/data/scratch/course/2025w300106/stoll/SRR36696742_2.fastq --outFileNamePrefix /lisc/data/scratch/course/2025w300106/stoll/results/map/SRR36696742_HldesRot8A_ --outSAMstrandField intronMotif  --outSAMtype BAM SortedByCoordinate

