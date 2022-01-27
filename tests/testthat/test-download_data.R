library(kaggler)


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
    expect_error(download_data(dataset, file_path, c("song_title")),
                 "Two columns should be retrieved")
})





