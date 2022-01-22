
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rlyrics

***Authors:*** Abhiket Gaurav, Artan Zandian, Macy Chan, Manju
Abhinandana Kumar

<!-- badges: start -->
<!-- badges: end -->

The goal of rlyrics is to extract and analyze lyrics. It provides
functions to download songs attribute datasets from Kaggle, extract
lyrics, clean text and generate a word cloud.

## Functions

| Function Name  | Input                                                                 | Output    | Description                                                                                                                      |
|----------------|-----------------------------------------------------------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------|
| download_data  | `dataset`, `file_path`, `columns`                                     | Dataframe | Downloads dataset from `kaggle dataset` and extract `columns` from csv file                                                      |
| extract_lyrics | `song_title`, `artist`                                                | String    | Extracts song lyrics of a song `song_title` by `artist`                                                                          |
| clean_text     | `text`, `bool_contra_dict`                                            | String    | Cleans up the `lyrics` by removing special characters, html tags, \#tags, contraction words and convert everything to lower case |
| plot_cloud     | `song`, `file_path`, `max_font_size`, `max_words`, `background_color` | Image     | Creates a word cloud image of most occurring words of a song/songs by an artist                                                  |

## Our Package in the R Ecosystem

There exist similar packages in R. However, this package is more
holistic, in the sense that it downloads the lyrics through APIs, cleans
the text, and then makes the word cloud. There are packages which does
one of these steps. This package takes care of all the steps. Of the
many other similar packages, the one that come close is:
[geniusr](https://cran.r-project.org/web/packages/geniusr/geniusr.pdf)

## Installation

You can install the development version of rlyrics from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/rlyrics")
```

## Features

The rlyrics packages contains the following four functions:

1.  `download_data()` The download data function downloads dataset from
    Kaggle, extracts the given columns from csv file and creates a
    dataframe.

2.  `extract_lyrics()` The extract lyrics function, extracts the lyrics
    from API for a song title and artist and saves it as a dataframe
    with columns song title, artist and lyrics.

3.  `clean_text()` The lyrics extracted from `extract_lyrics()` are not
    clean. It removes special characters, html tags, \#tags, contraction
    words and converts everything to lower case.

4.  `plot_cloud()` The plot cloud function creates a word cloud of most
    occurring words in a song/songs by an artist.

## Example

#### Downloading and Selecting

The first function in our package is the `download_data()`. Here you
will input your `kaggle dataset` and the columns to be extracted into a
dataframe with `columns` argument.

#### Extracting Lyrics

The `extract_lyrics()` function gets the `song_title` and `artist` name,
checks validity and availability of the combination, and extracts the
lyrics for that song in a raw string format with header, footer etc
which needs to be cleaned in order to create a human-readable text.

#### Cleaning

The `clean_text()` function turns the raw lyrics into a human-readable
text.

#### Creating WordCloud

WordCloud is an artistic rendering of the most frequent words in a text
document. A higher occurrence for a word is translated into a larger
text size.

## Contributors

The names of core development team is listed below.

|          Name           |   GitHub Handle   |
|:-----------------------:|:-----------------:|
|     Abhiket Gaurav      |      abhiket      |
|      Artan Zandian      |     artanzand     |
|        Macy Chan        |     macychan      |
| Manju Abhinandana Kumar | manju-abhinandana |

We welcome and recognize all contributions. Check out the contributing
guidelines. Please note that this project is released with a Code of
Conduct. By contributing to this project, you agree to abide by its
terms.

## License

`rlyrics` was created by Group 2. It is licensed under the terms of the
MIT license.
