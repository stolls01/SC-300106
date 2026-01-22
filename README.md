# Single cell course 2025 WS
This repository will contain the shell scripts used to complete computations via LiSC.

## Part 1: Montenegro
In order, the scripts used in the generation of a read count matrix from raw SRA data. Object: RNA of vampire bat spleen, reference number SRR36696742.

| Task    | Name of script | Type of output |
| -------- | ------- | ---------|
| Align SRA reads to a reference genome. | star_align.sh | .bam file |
| For quality control, create fastqc report | fastqc.sh | .html reports |
| Trim data to remove low-quality/low-information reads |    trim.sh  | |
| Generate a count table as a proxy for expression levels |counts.sh    | |
|   x  |star2.sh   | |
| Functional alignment of reads | eggnog.sh    | |
|  x   |cellranger.sh    | |


In case no .gtf file is available for target genome:
| Task    | Name of script | 
| -------- | ------- |
| stringtie for transcriptome assembly with evidence based annotation | annotation.sh    |
| Generate a count table as a proxy for expression levels |counts2.sh |



## Part 2: Cole
