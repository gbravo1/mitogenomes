#!/bin/sh

#SBATCH -p edwards
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 48000
#SBATCH -t 00-10:00:00
#SBATCH -J mtgenome
#SBATCH -o mtgenome_%j.out
#SBATCH -e mtgenome_%j.err
#SBATCH --mail-type=ALL        # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=gustavo_bravo@fas.harvard.edu # Email to which notifications will be sent

module load seqtk/1.2-fasrc01

# 1. Subsample sequences (In this case subsampling to 20% yields files of 6-8 Gb)

cd ../01_rawreads/

for file in *.fastq.gz;
do
	RAW=$(basename $file .fastq.gz)
		seqtk sample -s100 ${RAW}.fastq.gz 0.2 > ../02_subsampled/${RAW}_sub.fastq
done

# 2. Rename files (not really necessary. I just do so to maintain the same naming scheme in all my scripts)

cd ../02_subsampled/

for f in *R1*.fastq; 
do 
	mv -v "$f" "${f/220*R1_sub/sub_R1}"; 
done;

for f in *R2*.fastq; 
do 
	mv -v "$f" "${f/220*R2_sub/sub_R2}"; 
done;
