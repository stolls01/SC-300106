# Single cell course 2025 WS
This repository will contain the shell scripts used to complete computations via LiSC.

## Part 1: Montenegro
In order, the scripts used in the generation of a read count matrix from raw SRA data. Object: RNA of vampire bat spleen, reference number SRR36696742.

STAR ! 
fastqc !
trim !
STAR2
counts
counts
stringtie
cellranger
cellranger_polyp

| Task    | Name of script |
| -------- | ------- |
| Mapping SRA reads to a reference genome. | star_align.sh |
| For quality control, create fastqc report | fastqc.sh |
| Trim data to remove low-quality/low-information reads | trim.sh |
| Rerun the STAR mapping job on the trimmed data | star2.sh |
| Generate a count table as a proxy for expression levels | counts.sh |
| Functional alignment of reads | eggnog.sh    |
SINGLE CELL
| Aligns fastq files to an index |cellranger.sh    |

|Name of script| Type of output|
| -------- | ------- |
| star_align.sh | .bam file |
| fastqc.sh | .html reports |
|    trim.sh  | Quality report + 4 fastq files of dropped vs. retained fw and rv reads |
| counts.sh    | results/map/SRR36696742_feature_count.tsv results/map/SRR36696742_filtered_trimmed_HldesRot8A_Aligned.sortedByCoord.out.bam (compressed bam and feature count)|


In case no .gtf file is available for target genome:
| Task    | Name of script | 
| -------- | ------- |
| stringtie for transcriptome assembly with evidence based annotation | annotation.sh    |
| Generate a count table as a proxy for expression levels |counts2.sh |
annotation.sh uses stringtie, and counts2.sh uses stringtie_Hlxxxx.gtf file!!!



## Part 2: Cole
