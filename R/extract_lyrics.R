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
    if ( stringr::str_squish(song_title) == "" | stringr::str_squish(artist) == 0){
        stop("Empty input")
    }

    if ( class(song_title) != "character" | class(artist) != "character"){
       stop("Invalid column type, song title and artist have to be strings")
    }

     lyrics = ""
     url = paste0(
         "https://genius.com/",
         stringr::str_replace_all(artist, " ", "-"),
         "-",
         stringr::str_replace_all(song_title, " ", "-"),
         "-lyrics"
     )

     tryCatch({
     Scraped_webpage <- rvest::read_html(url)
     lyrics_html <- rvest::html_nodes(Scraped_webpage, xpath = '//*[@id="lyrics-root"]')
     stripped_htmltext <- rvest::html_text(lyrics_html)
     closeAllConnections()
     },
     error=function(cond) {
         stop("Song not found")
     })

     lyrics <- gsub("\\[[^][]*]"," ",stripped_htmltext)
     lyrics <- gsub("([a-z])([A-Z])", "\\1 \\2", lyrics)
     lyrics <- gsub(" Lyrics ", " ", lyrics)
     lyrics
 }

