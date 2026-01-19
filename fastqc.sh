#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=2G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/stoll/logs/fastqc.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/stoll/logs/fastqc.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12030007@unet.univie.ac.at

### Environment
module load FastQC

# specify input and output directory variables for cleaner code
### Variables
outDir="/lisc/data/scratch/course/2025w300106/stoll/results/fastqc"
readsDir="/lisc/data/scratch/course/2025w300106/stoll"


# will create html files with a fastqc report on sequence quality
# -t = threads = 2 here, isnt that computation-heavy
# supply fw and rv fastqc files

### Execution
echo "Started job at $(date)"
mkdir $outDir
fastqc -t 2 -o $outDir  $readsDir/SRR36696742_1.fastq $readsDir/SRR36696742_2.fastq
echo "Job finished at $(date)"
