.A <- setClass("A", slots=c(x="numeric"))

A <- function(x) {
    .A(x=x)
}

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

setGeneric(
    "foo",
    function(x, v) standardGeneric("foo"),
    signature="x"
)

setMethod("foo", "A", function(x, v) {
    tasks <- replicate(2, x)
    bplapply(tasks, function(x, v) {
        xslot(x) <- v
        validObject(x)
        x
    }, v)
})
