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

# Load metadata ----------------------------------------------------------------

# https://docs.google.com/spreadsheets/d/1wgAJPPWif1CC01iT2S6ZtoYlhOM0RSGFXS9LUggdLLA/edit?pli=1#gid=65110769
googledrive::drive_download(
  file = googledrive::as_id("1wgAJPPWif1CC01iT2S6ZtoYlhOM0RSGFXS9LUggdLLA"), 
  path = paste0(dir_out, "future_oracle.xlsx"), 
  overwrite = TRUE)

# Column
metadata_column <- xlsx::read.xlsx(
  file = paste0(dir_out, "future_oracle.xlsx"), 
  sheetName = "METADATA_COLUMN") %>% 
  janitor::clean_names() %>% 
  dplyr::select(-dplyr::starts_with("x"), -dplyr::starts_with("na"))
  
readr::write_csv(x = metadata_column, 
                 file = paste0(dir_out, "metadata_column.csv"))

# Table
metadata_table <- xlsx::read.xlsx(
  file = paste0(dir_out, "/future_oracle.xlsx"), 
  sheetName = "METADATA_TABLE") %>% 
  janitor::clean_names() %>% 
  dplyr::select(-dplyr::starts_with("x"), -dplyr::starts_with("na"))

readr::write_csv(x = metadata_table, 
                 file = paste0(dir_out, "metadata_table.csv"))

# Check work -------------------------------------------------------------------
# Find all metadata currently used across oracle
source("./code/metadata_current.R") 

# Update README and Share table to oracle --------------------------------------

# This is an accepted version of the data: 
dir_out <- paste0(getwd(), "/metadata/2023-01-27/")

pretty_date <- format(
  x = as.Date(strsplit(x = dir_out, 
                       split = "/", 
                       fixed = TRUE)[[1]][length(strsplit(x = dir_out, split = "/", fixed = TRUE)[[1]])]), 
  "%B %d, %Y")

rmarkdown::render(paste0("./README.Rmd"),
                  output_dir = "./",
                  output_file = paste0("README.md"))

source("./code/load_oracle.R") 
