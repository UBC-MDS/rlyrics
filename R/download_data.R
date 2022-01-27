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
#' dataset <- "geomack/spotifyclassification"
#' df <- download_data(dataset, "data", c("song_title", "artist"))
download_data <- function(dataset, file_path, columns) {

    # check input types

    if(!is.character(dataset)){
        stop("dataset name should be of type string")
    }
    if(!is.character(file_path)){
        stop("File_path  should be of type string")
    }
    if(!is.character(columns)){
        stop("The columns should be of type string")
    }
    if(length(columns) != 2){
        stop("Two columns should be retrieved")
    }

    if (!dir.exists(file.path(getwd(), file_path))){
        dir.create(file_path)
    }

    kaggler::kgl_auth(creds_file = '~/.kaggle/kaggle.json')
    response <- kaggler::kgl_datasets_download_all(owner_dataset = dataset)
    utils::download.file(response[["url"]], paste0(file_path,"/temp.zip"), mode="wb", quiet = TRUE)
    unzip_result <- suppressWarnings(utils::unzip(paste0(file_path,"/temp.zip"), exdir = file_path, overwrite = TRUE))
    df <- utils::read.csv(unzip_result)

    tryCatch({
            df <- df |> dplyr::select(tidyselect::all_of(columns))
    } , error = function(cond){
                stop("Incorrect column names, please check again")
            })
}


