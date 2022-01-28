#' Cleans the text by removing special characters, html_tags, #tags, contaction words, stop-words and convert everything to lower case.
#'
#' @param text A text to clean.
#' @return text Cleaned text
#' @export
#'
#' @examples
#' text <- "Early optimization is the root of all evil!"
#' clean_text(text)
#> [1] "early optimization is the root of all evil"

install.packages("stringr")
install.packages("textclean")
install.packages("tm")

library(stringr)
library(textclean)
library(tm)

clean_text <- function(text) {

    # check input types
    if(!is.character(text)){
        stop("Text should be a variable of type string.")
    }

    # check for blank string
    if(str_length(trimws(text)) == 0 ){
        stop("Blank text input")
    }
    
    # check if the text is encoded properly
    if(validUTF8(text) != TRUE){
        stop("please input a proper text")
    }
    
    # Lowercase
    temp <- tolower(text)
    # replacing contraction words
    temp <- replace_contraction(temp)
    # removing punctuation marks
    temp <- gsub('[[:punct:]]', '', temp)
    # removing stopwords special charaters
    temp <- removeWords(temp,stopwords("en"))
    # removing special charaters
    temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s]", " ")
    # removing extra spaces
    temp <- stringr::str_replace_all(temp,"[\\s]+", " ")
    return(temp)
}
