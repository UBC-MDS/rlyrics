song <- data.frame(song_title  = c("22", "Bohemian Rhapsody"),
                    artist = c("Taylor Swift", "Queen"))



# Testing input types are checked
test_that("song is a data.frame", {
    expect_error(plot_cloud(song = "22"),
                   "song should be of type dataframe")
})

test_that("song is a data.frame with two columns", {
    expect_error(plot_cloud(song = data.frame(song_title = c("22", "Bohemian Rhapsody")),
                              "song should be a data.frame with two columns"))
})

test_that("background_color is of type character", {
    expect_error(plot_cloud(song = song, background_color=23),
                   "background_color should be of type characte")
})

test_that("max_font_size is of type numeric", {
    expect_error(plot_cloud(song = song, max_font_size="ten"),
                 "Both max_font_size and max_words should be of type numeric.")
})

test_that("max_words is of type numeric", {
    expect_error(plot_cloud(song = song, max_words="ten"),
                   "Both max_font_size and max_words should be of type numeric.")
})


# Testing the case when no lyrics is found
test_that("song title and artist do not match", {
    expect_error(plot_cloud(song = data.frame(song_title  = c("22"),
                                              artist = c("Queen")),
                              "song title and artist do not match"))
})


# Testing if an image is created
test_that("image is created", {
    skip_on_ci()
    expect_equal(length(plot_cloud(song = song)), 8)
})

