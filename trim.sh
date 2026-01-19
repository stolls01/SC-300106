#!/bin/bash

#SBATCH --job-name=trim
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=32G
#SBATCH --time=4:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/stoll/logs/trim.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/stoll/logs/trim.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12030007@unet.univie.ac.at


### ENVIRONMENT
module load Trimmomatic

# again, set variables to make code more comprehensive / readable
### VARIABLES
echo "Creating variables"
wd="/lisc/data/scratch/course/2025w300106/stoll"
outDir="$wd/results/trimmomatic"

# make sure the directory where our files will go exists
### EXECUTION
echo "Started at $(date)"
mkdir -p $outDir

# PE for paired end
# # enable -summary to give us an overview file!!
# takes fastq as in files
# specify where outfile will be
# it takes illumina clip adapters in file i need to supply -- but in this case we dont have it and it also has an own database
# it trims 3 on the front adn 3 on the end (not always necessary)
# slidingwindow calculates score over specified amount of  bases. if combined quality drops below certain score, read is dropped.
# my reads are ~ 150 bp long so: minlen 75. if its bigger than that it is kept otherwise not

trimmomatic PE -threads 4 -summary $outDir/SRR36696742_summary.txt $wd/SRR36696742_1.fastq $wd/SRR36696742_2.fastq -baseout $outDir/SRR36696742 ILLUMINACLIP:$wd/trim_adapters.fa:2:30:10 SLIDINGWINDOW:4:20 MINLEN:75

echo "Finished at $(date)"
