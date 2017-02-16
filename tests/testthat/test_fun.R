## avoid attaching BiocParallel

register <- BiocParallel::register
bpstart <- BiocParallel::bpstart
SnowParam <- BiocParallel::SnowParam
bpstop <- BiocParallel::bpstop

test_that("bplapply in standard function works", {
    register(cl <- bpstart(SnowParam(2)))

    result <- f0(1)
    expect_equal(result[[1]], A(1))
    expect_equal(result[[2]], A(1))

    bpstop(cl)
})

test_that("bplapply calling nested function works.", {
    register(cl <- bpstart(SnowParam(2)))

    result <- f1(1)
    expect_equal(result[[1]], A(1))
    expect_equal(result[[2]], A(1))

    bpstop(cl)
})

test_that("bplapply in S4 method works", {
    register(cl <- bpstart(SnowParam(2)))

    result <- foo(A(0), 1)
    expect_equal(result[[1]], A(1))
    expect_equal(result[[2]], A(1))

    bpstop(cl)
})
