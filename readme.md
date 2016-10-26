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

Running the exact same analysis using the GTF file works fine. The entries between the GTF and GFF3 also differ, probably causing this problem.

## All entries for `ENSMUST00000045689` in GFF3 and GTF file for Mus.Musculus ensembl.86

### `Mus_musculus.GRCm38.86.gff3`

```
1	ensembl_havana	NMD_transcript_variant	4774436	4785698	.	-	.	ID=transcript:ENSMUST00000045689;Parent=gene:ENSMUSG00000033845;Name=Mrpl15-003;biotype=nonsense_mediated_decay;havana_transcript=OTTMUST00000072661;havana_version=1;transcript_id=ENSMUST00000045689;transcript_support_level=1;version=13
1	havana        	exon                  	4774436	4774516	.	-	.	Parent=transcript:ENSMUST00000045689;Name=ENSMUSE00000355250;constitutive=0;ensembl_end_phase=-1;ensembl_phase=-1;exon_id=ENSMUSE00000355250;rank=4;version=8                                                                               
1	havana        	three_prime_UTR       	4774436	4774516	.	-	.	Parent=transcript:ENSMUST00000045689                                                                                                                                                                                                        
1	havana        	exon                  	4777525	4777648	.	-	.	Parent=transcript:ENSMUST00000045689;Name=ENSMUSE00001246843;constitutive=0;ensembl_end_phase=-1;ensembl_phase=-1;exon_id=ENSMUSE00001246843;rank=3;version=1                                                                               
1	havana        	three_prime_UTR       	4777525	4777648	.	-	.	Parent=transcript:ENSMUST00000045689                                                                                                                                                                                                        
1	havana        	three_prime_UTR       	4782568	4782679	.	-	.	Parent=transcript:ENSMUST00000045689                                                                                                                                                                                                        
1	havana        	exon                  	4782568	4782733	.	-	.	Parent=transcript:ENSMUST00000045689;Name=ENSMUSE00001231214;constitutive=0;ensembl_end_phase=-1;ensembl_phase=0;exon_id=ENSMUSE00001231214;rank=2;version=1                                                                                
1	havana        	CDS                   	4782680	4782733	.	-	0	ID=CDS:ENSMUSP00000048472;Parent=transcript:ENSMUST00000045689;protein_id=ENSMUSP00000048472                                                                                                                                                
1	havana        	CDS                   	4785573	4785677	.	-	0	ID=CDS:ENSMUSP00000048472;Parent=transcript:ENSMUST00000045689;protein_id=ENSMUSP00000048472                                                                                                                                                
1	havana        	exon                  	4785573	4785698	.	-	.	Parent=transcript:ENSMUST00000045689;Name=ENSMUSE00000789568;constitutive=0;ensembl_end_phase=0;ensembl_phase=-1;exon_id=ENSMUSE00000789568;rank=1;version=1                                                                                
1	havana        	five_prime_UTR        	4785678	4785698	.	-	.	Parent=transcript:ENSMUST00000045689                                                                                                                                                                                                        
```

### `Mus_musculus.GRCm38.86.gtf`

```
1	havana	transcript     	4774436	4785698	.	-	.	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; transcript_support_level 1;                                                                 
1	havana	exon           	4785573	4785698	.	-	.	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; exon_number 1; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; exon_id ENSMUSE00000789568; exon_version 1; transcript_support_level 1;      
1	havana	CDS            	4785573	4785677	.	-	0	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; exon_number 1; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; protein_id ENSMUSP00000048472; protein_version 7; transcript_support_level 1;
1	havana	start_codon    	4785675	4785677	.	-	0	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; exon_number 1; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; transcript_support_level 1;                                                  
1	havana	exon           	4782568	4782733	.	-	.	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; exon_number 2; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; exon_id ENSMUSE00001231214; exon_version 1; transcript_support_level 1;      
1	havana	CDS            	4782683	4782733	.	-	0	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; exon_number 2; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; protein_id ENSMUSP00000048472; protein_version 7; transcript_support_level 1;
1	havana	stop_codon     	4782680	4782682	.	-	0	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; exon_number 2; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; transcript_support_level 1;                                                  
1	havana	exon           	4777525	4777648	.	-	.	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; exon_number 3; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; exon_id ENSMUSE00001246843; exon_version 1; transcript_support_level 1;      
1	havana	exon           	4774436	4774516	.	-	.	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; exon_number 4; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; exon_id ENSMUSE00000355250; exon_version 8; transcript_support_level 1;      
1	havana	five_prime_utr 	4785678	4785698	.	-	.	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; transcript_support_level 1;                                                                 
1	havana	three_prime_utr	4782568	4782679	.	-	.	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; transcript_support_level 1;                                                                 
1	havana	three_prime_utr	4777525	4777648	.	-	.	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; transcript_support_level 1;                                                                 
1	havana	three_prime_utr	4774436	4774516	.	-	.	gene_id ENSMUSG00000033845; gene_version 13; transcript_id ENSMUST00000045689; transcript_version 13; gene_name Mrpl15; gene_source ensembl_havana; gene_biotype protein_coding; havana_gene OTTMUSG00000029329; havana_gene_version 3; transcript_name Mrpl15-003; transcript_source havana; transcript_biotype nonsense_mediated_decay; havana_transcript OTTMUST00000072661; havana_transcript_version 1; transcript_support_level 1;                                                                 
```

You see that the entries differ between the `gtf` and the `gff3` files, which might cause the problem.

Removing the corresponding lines in the `gff3` file yields in the same error just with another transcript ID.

## Run Script with Output Log

```bash
mkdir logs
./example_workflow_gff3.sh > logs/output_gff3.log 2>&1
./example_workflow_gtf.sh > logs/output_gtf.log 2>&1
```

You will see that the analysis with the `gff3` file fails, while the one with the `gtf` file succeeds.

## Logs

You can find the logs under [releases](https://github.com/paulklemm/cuffmerge_bug/releases).

## Versions

- Samtools: Version 1.3.1 (using htslib 1.3.1)
- HISAT2: Version 2.0.4
- Cufflinks Version 2.2.1 linked against Boost version 104700

## Collection of Threads explaining the Problem

- [SEQanswers: Cuffmerge duplicate/invalid 'transcript'](http://seqanswers.com/forums/showthread.php?t=70357): No solution
- [Google Groups: Error: duplicate GFF ID 'ENST00000361547.2' encountered](https://groups.google.com/forum/#!topic/tuxedo-tools-users/smF5YxUmVq4): Solved by updating to Cufflinks 2.2.1. Since this is the one I'm using, this does not fix the problem → Posted answer here
- [Biostars: Running Cuffmerge error "duplicate/invalid 'transcript'](https://www.biostars.org/p/155160/): No solution
- [Biostars: Cuffmerge running error](https://www.biostars.org/p/119915/): No solution
- [Biostars: CuffMerge Error: GFF Error: duplicate/invalid 'transcript' feature](https://biostar.usegalaxy.org/p/17359/): No solution
- [Github: Cuffmerge GFF Error: duplicate/invalid 'transcript'](https://github.com/cole-trapnell-lab/cufflinks/issues/77): Bug report → Added this example there
- [Galaxy Mailing List: Cuffmerge error: duplicate GFF ID encountered](https://lists.galaxyproject.org/pipermail/galaxy-user/2013-July/006332.html): Use iGenomes GTF files
