#!/bin/bash

#SBATCH --job-name=stringtie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/stoll/logs/stringtie.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/stoll/logs/stringtie.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12030007@unet.univie.ac.at

### ENVIRONMENT AND VARIABLES
module load StringTie

wd="/lisc/data/scratch/course/2025w300106/stoll"
inBam=$wd/results/map/SRR36696742_filtered_trimmed_HldesRot8A_Aligned.sortedByCoord.out.bam


#the command takes an input bam file from specified location, puts output into results.
#-l will add a prefix to output transcripts, -p to use 4 cores,
#-j to increase necessary depth to detect a junction, -g to increase allowed gap between junctions from default
# -m to restrict minimum transcript length to 200, here upped from default 50 because my dataset contains mostly longer fragments
stringtie $inBam -o $wd/results/stringtie_HldesRot8A.gtf -l HldesRot8A -p 4 -j 10 -g 200 -m 200
