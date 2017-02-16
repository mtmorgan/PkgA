.A <- setClass("A", slots=c(x="numeric"))

setGeneric("xslot<-", function(x, value) standardGeneric("xslot<-"))

setReplaceMethod("xslot", c("A", "numeric"),
    function(x, value)
{
    x@x <- value
    validObject(x)
    x
})

f1a <- function(x, v) {
    xslot(x) <- v
    validObject(x)
    x
}

f0 <- function(v) {
    tasks <- replicate(2, .A(x=0))
    bplapply(tasks, function(x, v) {
        xslot(x) <- v
        validObject(x)
        x
    }, v)
}

f1 <- function(v) {
    tasks <- replicate(2, .A(x=0))
    bplapply(tasks, f1a, v)
}

.onLoad <- function(...) {
    if (interactive())
        register(bpstart(SnowParam(2)))
}
