
# Connect to Oracle ------------------------------------------------------------

# This has a specific username and password because I DONT want people to have access to this!
# source("C:/Users/emily.markowitz/Work/Projects/ConnectToOracle.R")
# source("C:/Users/emily.markowitz/Documents/Projects/ConnectToOracle.R")
source("Z:/Projects/ConnectToOracle.R")

# I set up a ConnectToOracle.R that looks like this: 
#   
#   PKG <- c("RODBC")
# for (p in PKG) {
#   if(!require(p,character.only = TRUE)) {  
#     install.packages(p)
#     require(p,character.only = TRUE)}
# }
# 
# channel<-odbcConnect(dsn = "AFSC",
#                      uid = "USERNAME", # change
#                      pwd = "PASSWORD", #change
#                      believeNRows = FALSE)
# 
# odbcGetInfo(channel)

# Upload data to oracle! -------------------------------------------------------

print("upload latest metadata reference tables to oracle!")

file.copy(from = paste0(dir_out, "metadata_column.csv"), 
          to = paste0(getwd(), "/metadata_column.csv"), 
          overwrite = TRUE)

file.copy(from = paste0(dir_out, "metadata_table.csv"), 
          to = paste0(getwd(), "/metadata_table.csv"), 
          overwrite = TRUE)

file_paths <- data.frame(
  file_path = c(paste0(getwd(), "/METADATA_COLUMN.csv"), 
                paste0(getwd(), "/METADATA_TABLE.csv")), 
  table_metadata = c(
    paste0("These tables provide the column metadata for all GAP oracle tables. These reference tables were last updated on ", pretty_date, ". "), 
    paste0("These tables provide the table metadata for all GAP oracle tables. These reference tables were last updated on ", pretty_date, ". "))
) 

oracle_upload(
    file_paths = file_paths, 
    metadata_column = metadata_column, 
    channel = channel_products, 
    schema = "GAP_PRODUCTS")
