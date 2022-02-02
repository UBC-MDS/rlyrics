#' Downloads dataset from kaggle and creates a dataframe with input columns
#'
#' @param dataset kaggle dataset name to download
#' @param columns list of columns to create a dataframe
#'
#' @return A dataframe with the given column names
#' @export
#'
#' @examples
#' dataset <- "geomack/spotifyclassification"
#' df <- download_data(dataset, c("song_title", "artist"))
download_data <- function(dataset, columns) {

    # check input types

    if(!is.character(dataset)){
        stop("dataset name should be of type string")
    }
    if(!is.character(columns)){
        stop("The columns should be of type string")
    }
    if(length(columns) != 2){
        stop("Two columns should be retrieved")
    }

    kaggler::kgl_auth()
    response <- kaggler::kgl_datasets_download_all(owner_dataset = dataset)
    utils::download.file(response[["url"]], "temp.zip" , mode="wb", quiet = TRUE)
    unzip_result <- suppressWarnings(utils::unzip("temp.zip" ))
    df <- utils::read.csv(unzip_result)

    if (columns[1] %in% colnames(df) && columns[2] %in% colnames(df)){
        df <- df |> dplyr::select(tidyselect::all_of(columns))
    } else {
        stop("Incorrect column names, please check again")
    }

    df

}


