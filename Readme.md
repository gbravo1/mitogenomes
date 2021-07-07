**This is a small pipeline to generate mitogenomes from Illumina short reads**

It uses the following programs:

 - seqtk 1.2: for subsampling fastq.gz files > ~ 6GB (https://github.com/lh3/seqtk)
 - trimmomatic 0.39: for removing adapters (http://www.usadellab.org/cms/?page=trimmomatic) 
 - NOVOPlasty 4.3.1: for mitogenome assembly (https://github.com/ndierckx/NOVOPlasty)

**These scripts are designed to run on the Harvard FAS Cannon Cluster** 
