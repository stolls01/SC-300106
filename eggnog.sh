#!/bin/bash

#SBATCH --job-name=eggnog
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/stoll/logs/eggnog.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/stoll/logs/eggnog.%j.err
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=a12030007@unet.univie.ac.a


# ENVIRONMENT
module load eggnogmapper


# proper way to use variables is with curly brackets around them
# VARIABLES
wd="/lisc/data/scratch/course/2025w300106/stoll"

# EXECUTION
# --itype wouldnt need to be specified, as proteins is default anyways
# cpu 0 will use all available
# tax scope: narrow it to e.g. eukaryota. auto: will build internally a taxonomic tree and prioritise closest lineages
#find specific taxa in command line: emapper.py --list_taxa | grep -i Primates
# vertebrata code is 7742
# --go_evidence - gene ontology classification of hierarchy. can decide to attach this information
# what kind of inferred data will be used? only experimental, only non-electronic, experimental etc.
# --output specify prefix. --excel will additionally create xsxl file
# --override to replace existing file from previous run that failed
emapper.py --cpu 0 -i ${wd}/proteins.corrected.fasta --itype proteins --evalue 1e-5 --tax_scope 7742 \
	--go_evidence experimental --output eggnog --override --output_dir $wd/results --excel

echo "Run ended"

