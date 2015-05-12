setClass("A")
setClass("B", contains="A")

setMethod("show", "A", function(object) cat("A\n"))
setMethod("show", "B", function(object) cat("B\n"))

setMethod("dim", "A", function(x) "A-dim")
setMethod("dim", "B", function(x) "B-dim")
