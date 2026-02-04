# Single cell course 2025 WS
This repository contains shell scripts utilized for computations with RNAseq data via LiSC.

## Part 1: Montenegro
This table shows, in order, the scripts used to generate a read count matrix from raw SRA data. Indicated are task name, name of file, and the module used for the respective computations. Object: RNA from vampire bat spleen, reference number SRR36696742. My directory on LiSC: /lisc/data/scratch/course/2025w300106/stoll

| Task    | Name of script | Module used |
| -------- | ------- | --------|
| Mapping SRA reads to a reference genome. | star_align.sh | STAR |
| For quality control, create fastqc report | fastqc.sh | FastQC |
| Trim data to remove low-quality/low-information reads | trim.sh | Trimmomatic |
| Rerun the STAR mapping job on the trimmed data | star2.sh | STAR |
| Generate a count table as a proxy for expression levels | counts.sh | Subread |
| Functional alignment of reads | eggnog.sh | eggnogmapper |

In case there is no .gtf file available for a target genome, we can create a de novo assembly from our filtered and trimmed .bam file using the module stringtie.
| Task    | Name of script | Module used |
| -------- | ------- | --------|
| transcriptome assembly with evidence based annotation | annotation.sh    | StringTie |
| generate a count table as a proxy for expression levels | counts2.sh | Subread |

## Part 2: Cole
Location of R notebook: /lisc/data/scratch/course/2025w300106/stoll
