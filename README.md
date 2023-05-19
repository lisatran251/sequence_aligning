# Sequence Aligning Genomic Project 

## Introduction 
The objective of aligning sequence reads to a reference genome is to determine the most
probable origin of each read in the genome; nevertheless, this process presents a number of
challenges. Even though there are many techniques to align the sequence reads to the
reference genome, they all require a certain amount of time to execute. It might take minutes
to days to execute the alignment, depending on the number of reads and the reference
genome size. Consequently, to provide the results before the deadline, the scientists must
prepare ahead. Moreover, if the alignment was conducted on a compute node using sbatch, the
status of all files must be verified prior to further analysis since the server's failure to analyze a
few files might result in the loss of findings from those files. In this assignment, sequence
alignment was utilized to determine the similarity between 10 .fastq files from 10 freshwater
burbot and two reference genomes, including fragmented burbot genomes and a complete
freshwater cod genome, which is related to the burbot. Next, we compare the proportion of
hits to each reference genome and quantify individual variance. Alignments are performed
using both bwa and bowtie2 software. Hence, we can observe the influence of software on the
alignments and determine if software plays a significant role in the sequence alignment. Hence,
we can observe the influence of software on the alignments and determine if software plays a
significant role in the sequence alignment. The benefits and drawbacks of aligning genomes to
distantly related genomes vs genomes from the same species vary. Because the fragmented
reference genomes are from the same species, it would be simpler to identify an exact match.
Yet, since the genome is incomplete, there may be missing portions. Hence, when the raw
genome is aligned to the reference genome, a few sections of the genome may be present in
the raw genome but absent from the reference genome, resulting in a substantial decrease in
the alignment rate. For the relative reference genome, since it is a high-quality genome, which
is longer than the draft genome from the same species, the likelihood of discovering matches is
greater. Nonetheless, although being related, their genomes are diverse. Thus, it may be
difficult to identify perfect matches between the raw genome and the relative reference
genome, resulting in a decrease in alignment rates.

## Methods
Work directory:
/scratch/thuyduye/genomic_method_w23/genomes_project2/Final_Proj
ect2

1. Run Shell Script
2. Run R Script 

## References
Akalin, A. (2020). Computational Genomics with R. Mapping/Aligning Reads to the
Genome. https://doi.org/10.1201/9780429084317
Anderson, E. (2023). Practical Computing and Bioinformatics for Conservation and
Evolutionary Genomics. Alignment of Sequence Data to a Reference Genome
(and Associated Steps).
Blay, C., Haffray, P., Bugeon, J., D’Ambrosio, J., Dechamp, N., Collewet, G., Enez, F.,
Petit, V., Cousin, X., Corraze, G., Phocas, F., & Dupont-Nivet, M. (2021). Genetic
Parameters and Genome-Wide Association Studies of Quality Traits
Characterised Using Imaging Technologies in Rainbow Trout, Oncorhynchus
mykiss. Frontiers in Genetics, 12. https://doi.org/10.3389/fgene.2021.639223
Fraslin, C., Koskinen, H., Nousianen, A., Houston, R. D., & Kause, A. (2022). Genomewide
association and genomic prediction of resistance to Flavobacterium
columnare in a farmed rainbow trout population. Aquaculture, 557, 738332.
https://doi.org/10.1016/j.aquaculture.2022.738332
Trapnell, C. (2009, May 1). How to map billions of short reads onto genomes. Nature.
https://www.nature.com/articles/nbt0509-
455?error=cookies_not_supported&code=a3a165a0-33e5-4ef6-9c19-
a68ca0050162
Wetjen, M., Schmidt, T., Schrimpf, A., & Schulz, R. (2019). Genetic diversity and
population structure of burbot Lota lota in Germany: Implications for conservation
and management. Fisheries Management and Ecology, 27(2), 170–184.
https://doi.org/10.1111/fme.12396

## Author 
This project was developed by Lisa Tran. 
