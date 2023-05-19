library(dplyr)
library(ggplot2)
#install.packages(mtcars)
attach(mtcars)

#load data
bowtie_burbot <- read_delim("Desktop/PROGRAM/W23/BINF6110/as2/bowtie_burbot.csv", delim = "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)
bowtie_cod <- read_delim("Desktop/PROGRAM/W23/BINF6110/as2/bowtie_cod.csv", delim = "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)
bwa_burbot <- read_delim("Desktop/PROGRAM/W23/BINF6110/as2/bwa_burbot.csv", delim = "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)
bwa_cod <- read_delim("Desktop/PROGRAM/W23/BINF6110/as2/bwa_cod.csv", delim = "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE)


#create a data table for bwa_burbot, sort based on alignment rates
bwa_burbot_read <- bwa_burbot[1:10, c(3)] %>%
         cbind(bwa_burbot[11:20,c(3)]) 
bwa_burbot_read <- setNames(bwa_burbot_read, c('reads','total'))        
bwa_burbot_read$rates <- (bwa_burbot_read$`reads`/bwa_burbot_read$`total`)*100
bwa_burbot_read$sw <- "bwa"
bwa_burbot_read$gr <- "burbot"
bwa_burbot_read$index <- 1:nrow(bwa_burbot_read)
bwa_burbot_read <- bwa_burbot_read[order(bwa_burbot_read$rates),]


#create a data table for bwa_cod, sort based on alignment rates
bwa_cod_read <- bwa_cod[1:10, c(3)] %>%
         cbind(bwa_cod[11:20,c(3)]) 
bwa_cod_read <- setNames(bwa_cod_read, c('reads','total'))        
bwa_cod_read$rates <- (bwa_cod_read$`reads`/bwa_cod_read$`total`)*100
bwa_cod_read$sw <- "bwa"
bwa_cod_read$gr <- "cod"
bwa_cod_read$index <- 1:nrow(bwa_cod_read)
bwa_cod_read <- bwa_cod_read[order(bwa_cod_read$rates),]


#create a data table for bowtie_burbot, sort based on alignment rates
bowtie_burbot_read <- bowtie_burbot[1:10, c(3)] %>%
         cbind(bowtie_burbot[11:20,c(3)]) 
bowtie_burbot_read <- setNames(bowtie_burbot_read, c('reads','total'))        
bowtie_burbot_read$rates <- (bowtie_burbot_read$`reads`/bowtie_burbot_read$`total`)*100
bowtie_burbot_read$sw <- "bowtie"
bowtie_burbot_read$gr <- "burbot"
bowtie_burbot_read$index <- 1:nrow(bowtie_burbot_read)
bowtie_burbot_read <- bowtie_burbot_read[order(bowtie_burbot_read$rates),]


#create a data table for bowtie_cod, sort based on alignment rates
bowtie_cod_read <- bowtie_cod[1:10, c(3)] %>%
         cbind(bowtie_cod[11:20,c(3)]) 
bowtie_cod_read <- setNames(bowtie_cod_read, c('reads','total'))        
bowtie_cod_read$rates <- (bowtie_cod_read$`reads`/bowtie_cod_read$`total`)*100
bowtie_cod_read$sw <- "bowtie"
bowtie_cod_read$gr <- "cod"
bowtie_cod_read$index <- 1:nrow(bowtie_cod_read)
bowtie_cod_read <- bowtie_cod_read[order(bowtie_cod_read$rates),]

#comebine 4 tables into one df
df <- rbind(bwa_burbot_read, bwa_cod_read, bowtie_burbot_read, bowtie_cod_read)

#barplot the 4 types of data for comparison
par(mfrow=c(2,2))
barplot(df$rate[1:10], main="bwa_burbot", col='blue', xlab='samples', ylab='alignment rates')
barplot(df$rate[21:30], main="bowtie_burbot", col='red', xlab='samples', ylab='alignment rates')
barplot(df$rate[11:20], main="bwa cod", col='blue', xlab='samples', ylab='alignment rates')
barplot(df$rate[31:40], main="bowtie_cod", col='red', xlab='samples', ylab='alignment rates')

#boxplot to see the difference between cod and burbot data
df %>%
         ggplot(aes(x = gr, y = rates, fill = rates)) +
         geom_boxplot(color='blue', fill='orange') 

#plot to compare the alignment rates from bowtie vs. bwa softwares
ggplot(df, aes(rates, fill=sw)) + geom_density() + labs(x='Alignment Rates', y=NULL)



