#' Extracting lyrics for a song
#'
#' @param song_title Title of the song
#' @param artist Artist of the song
#'
#' @return Return song lyrics
#' @export
#'
#' @examples
#' extract_lyrics( "22", "Taylor Swift")
extract_lyrics <- function(song_title, artist) {
    lyrics = ""
    url = paste0(
        "https://genius.com/",
        stringr::str_replace_all(artist, " ", "-"),
        "-",
        stringr::str_replace_all(song_title, " ", "-"),
        "-lyrics"
    )
    Scraped_webpage <- rvest::read_html(url)
    lyrics_html <- rvest::html_nodes(Scraped_webpage, '.lgZgEN')
    stripped_htmltext <- rvest::html_text(lyrics_html)
    vec_lyric <-
        gsub("([a-z])([A-Z])", "\\1 \\2", stripped_htmltext)
    for (i in vec_lyric) {
        lyrics = paste0(lyrics , i)
    }
    lyrics
}
