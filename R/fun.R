foo <- function(n)
    bplapply(seq_len(n), function(i) bar(i))

bar <- function(i) i
