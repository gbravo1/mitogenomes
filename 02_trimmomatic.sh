#!/bin/bash
#SBATCH -J trimm_srr
#SBATCH -o trimm_srr_%j.out
#SBATCH -e trimm_srr_%j.err
#SBATCH -n 4
#SBATCH -N 1
#SBATCH -t 16-00:00
#SBATCH -p edwards
#SBATCH --mem=32000
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gustavo_bravo@fas.harvard.edu

module load jdk/1.8.0_172-fasrc01

cd ../02_subsampled/

for file in *_R1.fastq;
do
  	GEN=$(basename $file _R1.fastq)
        echo working on $GEN
        java -jar ../00_scripts/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 4 -phred33 ${GEN}_R1.fastq ${GEN}_R2.fastq \
         ../03_trimmed-reads/${GEN}_trimmed_1.fastq ../04_orphaned-reads/${GEN}_un_1.fastq \
         ../03_trimmed-reads/${GEN}_trimmed_2.fastq ../04_orphaned-reads/${GEN}_un_2.fastq \
         SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:../00_scripts/Trimmomatic-0.39/adapters/adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
