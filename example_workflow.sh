# Download all required annotation files
mkdir annotation
cd annotation

echo "Download & unzip Mus Musculus GRCm38 primary assembly FASTA DNA file from ensembl (R.86)"
wget ftp://ftp.ensembl.org/pub/release-86/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna.primary_assembly.fa.gz
gunzip Mus_musculus.GRCm38.dna.primary_assembly.fa.gz

echo "Download & unzip Mus Musculus GRCm38 Transcript file (GFF3, R.86)"
wget ftp://ftp.ensembl.org/pub/release-86/gff3/mus_musculus/Mus_musculus.GRCm38.86.gff3.gz
gunzip Mus_musculus.GRCm38.86.gff3.gz

echo "Build HISAT2 Genome Index"
mkdir hisat2_build
hisat2-build Mus_musculus.GRCm38.dna.primary_assembly.fa hisat2_build -p 6

echo "Extract spliced sites from reference transcripts"
extract_splice_sites.py Mus_musculus.GRCm38.86.gff3 > splicesites.txt

# Go back to root folder
cd ..

echo "Download RNA-Seq reads"
wget https://owncloud.sf.mpg.de/index.php/s/bK9xC80OGxKaG9k/download
tar -xzf reads.tar

echo "Run HISAT2 alignment"
mkdir -p alignments/genome
hisat2 -p 8 --known-splicesite-infile annotation/splicesites.txt --dta-cufflinks -x annotation/hisat2_build -1 reads/rep1_1 -2 reads/rep1_2 -S alignments/genome/rep1.sam
hisat2 -p 8 --known-splicesite-infile annotation/splicesites.txt --dta-cufflinks -x annotation/hisat2_build -1 reads/rep2_1 -2 reads/rep2_2 -S alignments/genome/rep2.sam
echo "Convert SAM to BAM files"
samtools view -b -S alignments/genome/rep1.sam > alignments/genome/rep1.bam
samtools view -b -S alignments/genome/rep2.sam > alignments/genome/rep2.bam
echo "Sort BAM files"
srun samtools sort -o alignments/genome/rep1.sorted.bam alignments/genome/rep1.bam
srun samtools sort -o alignments/genome/rep2.sorted.bam alignments/genome/rep2.bam

echo "Run Cufflinks"
mkdir -p alignments/transcripts
cufflinks -q -p 8 --library-type fr-firststrand -g annotation/Mus_musculus.GRCm38.86.gff3 -o alignments/transcripts/rep1 alignments/genome/rep1.sorted.bam
cufflinks -q -p 8 --library-type fr-firststrand -g annotation/Mus_musculus.GRCm38.86.gff3 -o alignments/transcripts/rep2 alignments/genome/rep2.sorted.bam

echo "Run Cuffmerge"
> merge_list.txt
echo "alignments/transcripts/rep1/transcripts.gtf" >> merge_list.txt
echo "alignments/transcripts/rep2/transcripts.gtf" >> merge_list.txt
cuffmerge -p 8 -o alignments/transcripts/merged -g annotation/Mus_musculus.GRCm38.86.gff3 -s annotation/Mus_musculus.GRCm38.dna.primary_assembly.fa merge_list.txt
