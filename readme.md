# Problem Overview

Cuffmerge fails when using the GFF3 annotation file from Ensembl:

```
[Wed Oct 26 11:05:16 2016] Preparing output location alignments/transcripts/merged/
[Wed Oct 26 11:05:35 2016] Converting GTF files to SAM
[11:05:35] Loading reference annotation.
GFF Error: duplicate/invalid 'transcript' feature ID=transcript:ENSMUST00000045689
	[FAILED]
Error: could not execute gtf_to_sam
```

## Run Script with output Log

```bash
mkdir logs
./example_workflow_gff3 > logs/output_gff3.log 2>&1
./example_workflow_gtf > logs/output_gtf.log 2>&1
```

## Versions

- Samtools: Version 1.3.1 (using htslib 1.3.1)
- HISAT2: Version 2.0.4
- Cufflinks Version 2.2.1 linked against Boost version 104700
