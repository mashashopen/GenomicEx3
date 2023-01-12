
#create a list of sample IDs
samples="SRR4064356 SRR4064352 SRR4064357 SRR4064353 SRR4064358 SRR4064354"

#create a directory to save the data
mkdir data

#iterate over the list of samples # 1
for sample in $samples; do
	    #run the fastq-dump command
	        ~/sratoolkit.3.0.1-ubuntu64/bin/fastq-dump -X 10000 --split-files  $sample -O data
	done
	

# create a directory to save the data # 2
mkdir fastqc_results

# iterate over the list of samples

for sample in $samples; do
    # run the fastqc command
    fastqc data/$sample\_1.fastq -o fastqc_results
	fastqc data/$sample\_2.fastq -o fastqc_results

done



# create a directory to save the data # 3
mkdir fastp_results

# iterate over the list of samples


for sample in $samples; do
    # run the fastp command
    /home/mashashopen/fastp --in1 data/$sample\_1.fastq --in2 data/$sample\_2.fastq --out1 fastp_results/$sample\_1.fastp.fastq --out2 fastp_results/$sample\_3.fastp.fastq --unpaired1 fastp_results/$sample\_1.unpaired.fastq --unpaired2 fastp_results/$sample\_2.unpaired.fastq --average_qual 30 --trim_front1 15 --trim_tail1 1 --length_required 60 -O fastqc_better_results

done


: <<'COMMENT'
fastp --in1 data/SRR4064356\_1.fastq --in2 data/SRR4064356\_2.fastq --out1 fastqc_better_results/SRR4064356\_1.fastp.fastq --out2 fastqc_better_results/SRR4064356\_2.fastp.fastq --unpaired1 fastqc_better_results/SRR4064356\_1.unpaired.fastq --unpaired2 fastqc_better_results/SRR4064356\_2.unpaired.fastq --average_qual 30 --trim_front1 15 --trim_tail1 1 --length_required 60
fastp --in1 data/SRR4064352\_1.fastq --in2 data/SRR4064352\_2.fastq --out1 fastqc_better_results/SRR4064352\_1.fastp.fastq --out2 fastqc_better_results/SRR4064352\_2.fastp.fastq --unpaired1 fastqc_better_results/SRR4064352\_1.unpaired.fastq --unpaired2 fastqc_better_results/SRR4064352\_2.unpaired.fastq --average_qual 30 --trim_front1 15 --trim_tail1 1 --length_required 60
fastp --in1 data/SRR4064357\_1.fastq --in2 data/SRR4064357\_2.fastq --out1 fastqc_better_results/SRR4064357\_1.fastp.fastq --out2 fastqc_better_results/SRR4064357\_2.fastp.fastq --unpaired1 fastqc_better_results/SRR4064357\_1.unpaired.fastq --unpaired2 fastqc_better_results/SRR4064357\_2.unpaired.fastq --average_qual 30 --trim_front1 15 --trim_tail1 1 --length_required 60
fastp --in1 data/SRR4064353\_1.fastq --in2 data/SRR4064353\_2.fastq --out1 fastqc_better_results/SRR4064353\_1.fastp.fastq --out2 fastqc_better_results/SRR4064353\_2.fastp.fastq --unpaired1 fastqc_better_results/SRR4064353\_1.unpaired.fastq --unpaired2 fastqc_better_results/SRR4064353\_2.unpaired.fastq --average_qual 30 --trim_front1 15 --trim_tail1 1 --length_required 60
fastp --in1 data/SRR4064358\_1.fastq --in2 data/SRR4064358\_2.fastq --out1 fastqc_better_results/SRR4064358\_1.fastp.fastq --out2 fastqc_better_results/SRR4064358\_2.fastp.fastq --unpaired1 fastqc_better_results/SRR4064358\_1.unpaired.fastq --unpaired2 fastqc_better_results/SRR4064358\_2.unpaired.fastq --average_qual 30 --trim_front1 15 --trim_tail1 1 --length_required 60
fastp --in1 data/SRR4064354\_1.fastq --in2 data/SRR4064354\_2.fastq --out1 fastqc_better_results/SRR4064354\_1.fastp.fastq --out2 fastqc_better_results/SRR4064354\_2.fastp.fastq --unpaired1 fastqc_better_results/SRR4064354\_1.unpaired.fastq --unpaired2 fastqc_better_results/SRR4064354\_2.unpaired.fastq --average_qual 30 --trim_front1 15 --trim_tail1 1 --length_required 60
COMMENT



# create a directory to save the data # 2
mkdir fastqc_better_results

# iterate over the list of samples

for sample in $samples; do
    # run the fastqc command
    fastqc fastp_results/$sample\_1.fastp.fastq -o fastqc_better_results
	fastqc fastp_results/$sample\_2.fastp.fastq -o fastqc_better_results

done
