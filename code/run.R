#' -----------------------------------------------------------------------------
#' title: Create metadata for all data 
#' author: EH Markowitz (emily.markowitz AT noaa.gov)
#' start date: 2023-02-01
#' last modified: 2023-02-01
#' Notes: 
#' -----------------------------------------------------------------------------

# START ------------------------------------------------------------------------

# source("./code/run.r")

dir_out <- paste0(getwd(), "/metadata/", Sys.Date(), "/")
dir.create(dir_out)
link_repo <- "https://github.com/afsc-gap-products/metadata/"


library(magrittr)
library(googledrive)
library(xlsx)
library(janitor)

# Support scripts --------------------------------------------------------------

source('./code/functions_oracle.R')

# sign into google drive -------------------------------------------------------

googledrive::drive_deauth()
googledrive::drive_auth()
1

source("./code/metadata_dl.R") 

# Check work -------------------------------------------------------------------
# Find all metadata currently used across oracle
source("./code/metadata_current.R") 

# Update README and Share table to oracle --------------------------------------

# This is an accepted version of the data: 
dir_out <- paste0(getwd(), "/metadata/2023-02-12/")

pretty_date <- format(
  x = as.Date(strsplit(x = dir_out, 
                       split = "/", 
                       fixed = TRUE)[[1]][length(strsplit(x = dir_out, split = "/", fixed = TRUE)[[1]])]), 
  "%B %d, %Y")

rmarkdown::render(paste0("./README.Rmd"),
                  output_dir = "./",
                  output_file = paste0("README.md"))

source("./code/load_oracle.R") 
