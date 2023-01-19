#' -----------------------------------------------------------------------------
#' title: Create metadata for all data 
#' author: EH Markowitz (emily.markowitz AT noaa.gov)
#' start date: 2023-02-01
#' last modified: 2023-02-01
#' Notes: 
#' -----------------------------------------------------------------------------

# START ------------------------------------------------------------------------

# source("./code/run.r")

# *** REPORT KNOWNS ------------------------------------------------------------

# The surveys we will consider covering in this data are: 
surveys <- 
  data.frame(survey_definition_id = c(143, 98, 47, 52, 78), 
             SRVY = c("NBS", "EBS", "GOA", "AI", "BSS"), 
             SRVY_long = c("northern Bering Sea", 
                           "eastern Bering Sea", 
                           "Gulf of Alaska", 
                           "Aleutian Islands", 
                           "Bering Sea Slope") )

# Support scripts --------------------------------------------------------------

dir_out <- paste0(getwd(), "/metadata/", Sys.Date(), "/")
dir.create(dir_out)

library(magrittr)

source('./code/functions_oracle.R')
source('./code/metadata.R')

# Check work -------------------------------------------------------------------
# Find all metadata currently used across oracle
source("./code/metadata_current.R") 

# Update README and Share table to oracle --------------------------------------

# This is an accepted version of the data: 
dir_out <- paste0(getwd(), "/metadata/2023-01-18/")

pretty_date <- format(
  x = as.Date(strsplit(x = dir_out, 
                       split = "/", 
                       fixed = TRUE)[[1]][length(strsplit(x = dir_out, split = "/", fixed = TRUE)[[1]])]), 
  "%B %d, %Y")

rmarkdown::render(paste0("./README.Rmd"),
                  output_dir = "./",
                  output_file = paste0("README.md"))

source("./code/load_oracle.R") 
