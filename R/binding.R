setGeneric("subsetSites",
           function(object, index){
             standardGeneric("subsetSites")
           }
)

setMethod("subsetSites",
          signature("DNAStringSet", "integer"),
          function(object, index){
            index <- rep.int(list(index), length(object))
            return(object[index])
          }
)

doit <- function() {
    dna <- DNAStringSet(
        readDNAMultipleAlignment(
            filepath = system.file("extdata", "msx2_mRNA.aln",
                                   package="Biostrings"),
            format="clustal"))
    subsetSites(dna, 1:50)
}
