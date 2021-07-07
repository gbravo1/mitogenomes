#!/bin/sh
 
#SBATCH -p edwards
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --mem 48000
#SBATCH -t 00-24:00:00
#SBATCH -J mtgenome
#SBATCH -o mtgenome_%j.out
#SBATCH -e mtgenome_%j.err
#SBATCH --mail-type=ALL        # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=gustavo_bravo@fas.harvard.edu # Email to which notifications will be sent

module load perl/5.26.1-fasrc01
perl NOVOPlasty4.3.1.pl -c 03_config.txt
