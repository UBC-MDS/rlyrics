#' Cleans the text by removing special characters, html_tags, #tags, contaction words, stop-words and convert everything to lower case.
#'
#' @param text A text to clean.
#' @return text Cleaned text
#' @export
#'
#' @examples
#' text <- "Early optimization is the root of all evil!"
#' clean_text(text)
#> [1] "early optimization root evil"

clean_text <- function(text) {

    # check input types
    if(!is.character(text)){
        stop("Text should be a variable of type string.")
    }

    # check for blank string
    if(stringr::str_length(trimws(text)) == 0 ){
        stop("Blank text input")
    }

    # Lowercase
    temp <- tolower(text)
    # replacing contraction words
    temp <- textclean::replace_contraction(temp)
    # removing punctuation marks
    temp <- gsub('[[:punct:]]', '', temp)
    # removing stopwords special charaters
    temp <- tm::removeWords(temp,stopwords("en"))
    # removing special charaters
    temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s]", " ")
    # removing extra spaces
    temp <- stringr::str_replace_all(temp,"[\\s]+", " ")
    return(temp)
}
