
#create a list of sample IDs
samples="SRR4064356 SRR4064352 SRR4064357 SRR4064353 SRR4064358 SRR4064354"

#create a directory to save the data # 1
mkdir data

# iterate over the list of samples and download 10000 reads
for sample in $samples; do
	    #run the fastq-dump command
	        ~/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump -X 10000 --split-files  $sample -O data
	done
	

# create a directory to save the data # 2
mkdir fastqc_results

# iterate over the list of samples and run fastqc on each
for sample in $samples; do
    # run the fastqc command
    fastqc data/$sample\_1.fastq -o fastqc_results
	fastqc data/$sample\_2.fastq -o fastqc_results

done

# create a directory to save the data # 3
mkdir fastp_results

# iterate over the list of samples and run fastp to improve the results
for sample in $samples; do
    # run the fastp command
    ~/fastp --in1 data/$sample\_1.fastq --in2 data/$sample\_2.fastq --out1 fastp_results/$sample\_1.fastp.fastq --out2 fastp_results/$sample\_2.fastp.fastq --unpaired1 fastp_results/$sample\_1.unpaired.fastq --unpaired2 fastp_results/$sample\_2.unpaired.fastq --average_qual 30 --trim_front1 15 --trim_tail1 1 --length_required 60
done


# create a directory to save the data # 4
mkdir fastqc_better_results

# iterate over the list of samples and run fastqc to evaluate
for sample in $samples; do
    # run the fastqc command
    fastqc fastp_results/$sample\_1.fastp.fastq -o fastqc_better_results
	fastqc fastp_results/$sample\_2.fastp.fastq -o fastqc_better_results

done

samples="2 3 4 6 7 8"

# create VCF files
mkdir ../VCF/
for sample in $samples;
    do
        bcftools mpileup -f ~/GenomicEx3/DM6Genome/dm6.fa ~/GenomicEx3/data_m/SRR406435$sample.mapped.sorted.bam  | bcftools call -mv -o ../VCF/SRR406435$sample.vcf
done
