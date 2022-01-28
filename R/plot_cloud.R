#' Creates a wordcloud of most occuring words in a string or list of strings
#'
#' @param song with artist as dictionary key and song_title as value. Both key and value are strings.
#' @param file_path The location to save the file
#' @param max_font_size maximum font size
#' @param max_words maximum number of words to be included in wordcloud
#' @param background_color background color
#' @param show whether to display the plot to screen
#'
#' @return A wordcloud image
#' @export
#'
#' @examples
<<<<<<< Updated upstream
plot_cloud <- function(
    song,
    file_path,
    max_font_size=30,
    max_words=120,
    background_color="black",
    show=False){

=======
#' song <- data.frame(song_title  = c("22", "Bohemian Rhapsody"), artist = c("Taylor Swift", "Queen"))
#' plot_cloud(song, max_font_size=1.6, max_words=100, background_color="white")


plot_cloud <- function(song, max_font_size=1, max_words=100, background_color="black"){

    # check input types
    if(!is.data.frame(song)){
        stop("song should be of type dataframe")
    }

    if(ncol(song) != 2){
        stop("song only accepts a dataframe with two columns")
    }

    if(!is.character(background_color)){
        stop("background_color should be of type character")
    }

    if(!is.numeric(max_font_size) | !is.numeric(max_words)){
        stop("Both max_font_size and max_words should be of type numeric.")
    }


    text = ""
    # Create a string of all song lyrics
    for (i in seq_along(song)){
        song_title <- song[[i, 1]]
        artist <- song[[i, 2]]
        raw_lyrics <- extract_lyrics(song_title, artist)
        clean_lyrics <- clean_text(text=raw_lyrics)
        text <- paste(text, clean_lyrics)
    }

    # Create word frequency matrix
    corpus <- tm::Corpus(tm::VectorSource(text))
    dtm <- tm::TermDocumentMatrix(corpus)
    matrix <- as.matrix(dtm)
    words <- sort(rowSums(matrix),decreasing=TRUE)
    df <- data.frame(word = names(words), freq=words)

    # Filter max_words
    max_words <- min(max_words, nrow(df))
    df <- df |> dplyr::slice(1:max_words)

    # Generate the wordcloud
    wordcloud2::wordcloud2(data=df, size=max_font_size, backgroundColor=background_color)

    TRUE
>>>>>>> Stashed changes
}
