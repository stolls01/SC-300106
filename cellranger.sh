#!/bin/bash

#SBATCH --job-name=cellranger
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/stoll/logs/cellranger.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/stoll/logs/cellranger.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=a12030007@unet.univie.ac.at


### ENVIRONMENT
module load CellRanger
module list

### VARIABLES
wdir="/lisc/data/scratch/course/2025w300106"
index="$wdir/common/NV2_fluo"
fastq_dir="$wdir/common/blastula.12h/run1,$wdir/common/blastula.12h/run2,$wdir/common/blastula.12h/run3"
sample="89085"
od="${wdir}/stoll/results/cellranger"
id="blastula_12h"


#this tool will find all of the fastq_dir directories and use all the samples with the given $sample name and align them to $index

#cellranger count [OPTIONS] --id $id --create-bam false
#transcriptome is the index which was already generated
#force-cells to accept 10000 cells - it's gonna count until it reaches 10000, no matter cell quality
# by default it will try to run analysis on dataset, which we dont want. disable this with --nosecondary
# use 16 cpus
# set 64 gigs
# make output directory in our own subdirectory


### EXECUTION
mkdir -p ${od} cd ${od}

cellranger count --transcriptome $index \
	--fastqs ${fastq_dir} \
	--force-cells 10000 --nosecondary \
	--localcores 16 \
	--sample $sample \
	--id $id --create-bam false \
