#!/bin/bash
#SBATCH --job-name="trimmomatic"
#SBATCH --output=/home/klorilla/logs/"trimmed.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 0:30:00
#SBATCH --no-requeue

USER=/home/klorilla

module load trimmomatic

for filename in $USER/data/*.fastq.gz
do
base=$(basename $filename .fastq.gz)
echo $base

java -jar /opt/biotools/trimmomatic/trimmomatic-0.35.jar SE $USER/data/${base}.fastq.gz $USER/quality/${base}.qc.fq.gz ILLUMINACLIP:TruSeq2-PE.fa:2:40:15:2:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

done
