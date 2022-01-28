
dataset <- "geomack/spotifyclassification"
columns <- c("song_title", "artist")


# Testing input types
test_that("dataset name should be of type string", {
    expect_error(download_data(1, columns),
                 "dataset name should be of type string")
})

test_that("The columns should be of type string", {
    expect_error(download_data(dataset, 1),
                 "The columns should be of type string")
})

test_that("Two columns should be retrieved", {
    expect_error(download_data(dataset , c("song_title")),
                 "Two columns should be retrieved")
})

test_that("Incorrect column names, please check again", {
    expect_error(download_data(dataset , c("song_title", "test")),
                 "Incorrect column names, please check again")
})

test_that("hpapy case", {
    target <- read.csv ("data.csv")
    output <- download_data(dataset, c("song_title", "artist"))
    expect_equal(target[,c('song_title', 'artist')], output)
})


