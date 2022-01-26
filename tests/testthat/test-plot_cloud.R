source("R/plot_cloud.R")
library(testthat)

song <- data.frame(song_title  = c("22", "Bohemian Rhapsody"),
                    artist = c("Taylor Swift", "Queen"))



# Testing input types are checked
test_that("song is a data.frame", {
    expect_message(plot_cloud(song = "22"),
                   "song should be a data.frame")
})

test_that("song is a data.frame with two columns", {
    expect_message(plot_cloud(song = data.frame(song_title = c("22", "Bohemian Rhapsody")),
                              "song should be a data.frame with two columns"))
})

test_that("background_color is of type character", {
    expect_message(plot_cloud(song = song, file_path = file_path, background_color=23),
                   "background_color should be of type character")
})

test_that("max_font_size is of size int", {
    expect_message(plot_cloud(song = song, file_path = file_path, max_font_size="ten"),
                   "max_font_size should be of size int")
})

test_that("max_words is of size int", {
    expect_message(plot_cloud(song = song, file_path = file_path, max_words="ten"),
                   "max_words should be of size int")
})


# Testing the case when no lyrics is found
test_that("song title and artist do not match", {
    expect_message(plot_cloud(song = data.frame(song_title  = c("22"), artist = c("Queen")),
                              "song title and artist do not match"))
})



# Testing if an image is created
test_that("image is created", {
    expect_true(plot_cloud(song = song))
})

