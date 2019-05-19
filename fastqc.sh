#!/bin/bash
#SBATCH --job-name="fastqc"
#SBATCH --output=/home/klorilla/logs/"fastqc.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 05:30:00
#SBATCH --no-requeue

module load fastqc/0.11.4

fastqc -o /home/klorilla/fastqc ~/trimmomatic/*P.fq.gz


