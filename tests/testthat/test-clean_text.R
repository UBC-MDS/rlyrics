# Testing output/input is correct
lyrics <- "Early optimization is the root of all evil!"
test_that("output is string", {
    expect_equal(is.character(clean_text(lyrics)), TRUE)
})

lyrics = " "
test_that("empty dataframe", {
    expect_warning(clean_text(lyrics))
})

lyrics = 22
test_that("wrong input type for lyrics", {
    expect_warning(clean_text(lyrics))
})

lyrics = "asdllll³³œ¿¿¿"
test_that("Non UTF8 Character", {
    expect_warning(clean_text(lyrics))
})

