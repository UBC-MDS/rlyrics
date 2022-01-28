
dataset <- "geomack/spotifyclassification"
file_path <- "data/spotify"
columns <- c("song_title", "artist")


# Testing input types
test_that("dataset name should be of type string", {
    expect_error(download_data(1, file_path, columns),
                 "dataset name should be of type string")
})

test_that("File_path  should be of type string", {
    expect_error(download_data(dataset, 1, columns),
                 "File_path  should be of type string")
})

test_that("The columns should be of type string", {
    expect_error(download_data(dataset, file_path, 1),
                 "The columns should be of type string")
})

test_that("Two columns should be retrieved", {
    expect_error(download_data(dataset, file_path , c("song_title")),
                 "Two columns should be retrieved")
})

test_that("Incorrect column names, please check again", {
    expect_error(download_data(dataset, file_path , c("song_title", "test")),
                 "Incorrect column names, please check again")
})

test_that("hpapy case", {
    target <- read.csv(here::here(file_path, "data.csv"))
    output <- download_data(dataset, file_path, c("song_title", "artist"))
    expect_equal(target[,c('song_title', 'artist')], output)
})




