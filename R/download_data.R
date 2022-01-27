#' Downloads dataset from kaggle to filepath and creates a dataframe with input columns
#'
#' @param dataset kaggle dataset name to download
#' @param file_path location to save the file
#' @param columns list of columns to create a dataframe
#'
#' @return A dataframe with the given column names
#' @export
#'
#' @examples
#' dataset = "geomack/spotifyclassification"
#' df <- download_data(dataset, "data/spotify_attributes", ["song_title", "artist"])
download_data <- function(dataset, file_path, columns){

}
