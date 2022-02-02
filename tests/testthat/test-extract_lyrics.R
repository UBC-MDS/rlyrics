test_that("happy case", {
    skip_on_ci(message="Requires access to the Genius website.")
    target = readr::read_file(here::here("tests", "testthat", "data","lyrics_22.txt")) |> substr(1, 100)
    output = extract_lyrics("22", "Taylor Swift") |> substr(1, 100)
    expect_equal(target , output)
})


test_that("empty dataframe", {
    expect_error(extract_lyrics("", "Taylor Swift") , "Empty input")
})


test_that("invalid column type", {
    expect_error(extract_lyrics( TRUE , "Taylor Swift") , "Invalid column type, song title and artist have to be strings")
    expect_error(extract_lyrics( "22" , TRUE) , "Invalid column type, song title and artist have to be strings")
})

test_that("song not found", {
    expect_error(extract_lyrics( "Mary has a little lamb" , "Taylor Swift") , "Song not found")
    expect_error(extract_lyrics( "22" , "charlie puth") , "Song not found")
})
