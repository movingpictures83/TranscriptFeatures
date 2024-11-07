## ---- echo = FALSE, results = 'hide'---------------------------------------
library(knitr)
opts_chunk$set(error = FALSE)

## ----style, echo = FALSE, results = 'asis'---------------------------------
##BiocStyle::markdown()

## ---- message = FALSE------------------------------------------------------
library(SGSeq)

#si
## --------------------------------------------------------------------------
input <- function(inputfile) {
   #si$file_bam <<- inputfile
}

run <- function() {}

output <- function(outputfile) {
#path <- system.file("extdata", package = "SGSeq")
#si$file_bam <- file.path("bams/", si$file_bam)

## ---- message = FALSE------------------------------------------------------
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene
txdb <- keepSeqlevels(txdb, "chr16")

seqlevelsStyle(txdb) <- "NCBI"

## --------------------------------------------------------------------------
txf_ucsc <- convertToTxFeatures(txdb)
txf_ucsc <- txf_ucsc[txf_ucsc %over% gr]
write.csv(txf_ucsc, paste(outputfile,"csv",sep="."))
saveRDS(txf_ucsc, paste(outputfile, "rds", sep="."))
}

