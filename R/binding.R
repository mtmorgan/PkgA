setClass("A")
setClass("B", contains="A")
setMethod("show", "A", function(object) cat("A\n"))
setMethod("show", "B", function(object) cat("B\n"))
