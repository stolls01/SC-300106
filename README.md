# Single cell course 2025 WS
This repository contains select shell scripts utilized for computations with RNAseq data via LiSC.

## Part 1: Montenegro
In order, the scripts used in the generation of a read count matrix from raw SRA data. Object: RNA from vampire bat spleen, reference number SRR36696742.

| Task    | Name of script |
| -------- | ------- |
| Mapping SRA reads to a reference genome. | star_align.sh |
| For quality control, create fastqc report | fastqc.sh |
| Trim data to remove low-quality/low-information reads | trim.sh |
| Rerun the STAR mapping job on the trimmed data | star2.sh |
| Generate a count table as a proxy for expression levels | counts.sh |
| Functional alignment of reads | eggnog.sh    |

In case there is no .gtf file is available for target genome, we create a de novo assembly from our filtered and trimmed .bam file using the module stringtie.
| Task    | Name of script | 
| -------- | ------- |
| transcriptome assembly with evidence based annotation | annotation.sh    |
| generate a count table as a proxy for expression levels | counts2.sh |

## Part 2: Cole
Location of R notebook: /lisc/data/scratch/course/2025w300106/stoll
