test_that("happy case", {
    skip_on_ci()
    target = "22 Lyrics[Verse 1]It feels like a perfect nightTo dress up like hipstersAnd make fun of our exes, uh"
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
