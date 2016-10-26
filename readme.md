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

./example_workflow > output.log 2>&1