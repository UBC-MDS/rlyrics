# Testing output/input is correct
lyrics <- "Early optimization is the root of all evil!"
test_that("output is string", {
    expect_equal(is.character(clean_text(lyrics)), TRUE)
})

lyrics <- " "
test_that("empty dataframe", {
    expect_error(clean_text(lyrics),"Blank text input")
})

lyrics <- 22
test_that("wrong input type for lyrics", {
    expect_error(clean_text(lyrics), "Text should be a variable of type string.")
})

