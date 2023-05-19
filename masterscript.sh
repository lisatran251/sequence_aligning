##bwa
#gunzip compressed files
gunzip *.fq
#run index
bwa index -a bwtsw GCF_902167405.1_gadMor3.0_genomic.fna
bwa index -a bwtsw GCA_900302385.1_ASM90030238v1_genomic.fna
#aligning using bwa software by using run_bwa_burbot.sh and
run_bwa_cod.sh.
#this two scripts will then export multiple .sam files which
names including reference genome and sample number of 10 samples
for file in *.fastq; do sbatch run_bwa_burbot.sh $file; done
for file in *.fastq; do sbatch run_bwa_cod.sh $file; done
#run statistics and write to a .csv file
##burbot
for file in burbot*.sam ; do samtools stats $file | grep "reads
mapped:" >> bwa_burbot.csv ; done
for file in burbot*.sam ; do samtools stats $file | grep "raw
total sequences:" >> bwa_burbot.csv; done
##cod
for file in cod*.sam ; do samtools stats $file | grep "reads
mapped:" >> bwa_cod.csv ; done
for file in cod*.sam ; do samtools stats $file | grep "raw total
sequences:" >> bwa_cod.csv; done
##bowtie2
#run index
bowtie2-build GCF_902167405.1_gadMor3.0_genomic.fna
GCF_902167405.1_gadMor3.0_genomic
bowtie2-build GCA_900302385.1_ASM90030238v1_genomic.fna
GCA_900302385.1_ASM90030238v1_genomic
#tried to run sbatch .sh script but the server failed to analyze
a few samples. To avoid the failure -> run locally
#alignment
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_70_TRL_363.fq.gz -S ex1cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_71_TRL_421.fq -S ex2burbot_bowtie.sam --very-sensitive-local
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_73_TRL_571.fq -S ex3burbot_bowtie.sam --very-sensitive-local
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_76_TOL_358.fq -S ex4burbot_bowtie.sam --very-sensitive-local
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_79_TOL_355.fq -S ex5burbot_bowtie.sam --very-sensitive-local
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_74_TRL_599.fq -S ex6burbot_bowtie.sam --very-sensitive-local
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_77_TOL_360.fq -S ex7burbot_bowtie.sam --very-sensitive-local
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_72_TRL_571.fq -S ex8burbot_bowtie.sam --very-sensitive-local
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_75_TRL_449.fq -S ex9burbot_bowtie.sam --very-sensitive-local
bowtie2 -x GCA_900302385.1_ASM90030238v1_genomic -U
871_78_TOL_325.fq -S ex10burbot_bowtie.sam --very-sensitivelocal
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_70_TRL_363.fq.gz -S ex1cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_71_TRL_421.fq -S ex2cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_73_TRL_571.fq -S ex3cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_76_TOL_358.fq -S ex4cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_79_TOL_355.fq -S ex5cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_74_TRL_599.fq -S ex6cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_77_TOL_360.fq -S ex7cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_72_TRL_571.fq -S ex8cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_75_TRL_449.fq -S ex9cod_bowtie.sam --very-sensitive-local
bowtie2 -x GCF_902167405.1_gadMor3.0_genomic -U
871_78_TOL_325.fq -S ex10cod_bowtie.sam --very-sensitive-local
#bowtie2 returned the stats after running. Write the .csv file
for -R script purposes.
#run statistics and write to a .csv file
##burbot
for file in ex*burbot*.sam ; do samtools stats $file | grep
"reads mapped:" >> bowtie_burbot.csv ; done
for file in ex*burbot*.sam; do samtools stats $file | grep "raw
total sequences:" >> bowtie_burbot.csv; done
##cod
for file in ex*cod*.sam; do samtools stats $file | grep "reads
mapped:" >> bowtie_cod.csv; done
for file in ex*cod*.sam; do samtools stats $file | grep "raw
total sequences:" >> bowtie_cod.csv; done
