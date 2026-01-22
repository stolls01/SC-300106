# Single cell course 2025 WS
This repository will contain the shell scripts used to complete computations via LiSC.

## Part 1: Montenegro
In order, the scripts used in the generation of a read count matrix from raw SRA data. Object: RNA of vampire bat spleen, reference number SRR36696742.

| Task    | Name of script |
| -------- | ------- |
| Align SRA reads to a reference genome. Output: .bam file  | star_align.sh |
| For quality control, create fastqc report | fastqc.sh |
| Trim data to remove low-quality/low-information reads |    trim.sh  |
| Generate a count table as a proxy for expression levels |counts.sh    |
|   x  |star2.sh   |
|     x|counts2.sh    |
| If no .gtf file exists: stringtie for transcriptome assembly with evidence based annotation |annotation.sh    |
| Functional alignment of reads | eggnog.sh    |
|  x   |cellranger.sh    |



## Part 2: Cole
