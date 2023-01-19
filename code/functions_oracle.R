#' Define RODBC connection to ORACLE
#'
#' @param schema default = 'AFSC'. 
#'
#' @return oracle channel connection
#' @export
#'
#' @examples
#' # Not run
#' # channel <- oracle_connect()
oracle_connect <- function(schema='AFSC', 
                             username = NULL, 
                             passowrd = NULL){(echo=FALSE)
    library("RODBC")
    library("getPass")
    if (is.null(username)) {
      username <- getPass(msg = "Enter your ORACLE Username: ")
    }
    if (is.null(password)) {
      password <- getPass(msg = "Enter your ORACLE Password: ")
    }
    channel  <- RODBC::odbcConnect(paste(schema),
                                   paste(username),
                                   paste(password), 
                                   believeNRows=FALSE)
  }
  

#' Download tables fro oracle
#'
#' @param locations A string of each oracle schema.table you need to download. 
#' @param channel Establish your oracle connection using a function like oracle_connect. 
#' @param dir_out
#'
#' @return
#' @export
#'
#' @examples
#' # Not run: 
#' # locations <- c("RACEBASE.CATCH", "RACEBASE.HAUL")
#' # channel <- oracle_connect()
#' # oracle_dl(locations, channel)
oracle_dl <- function(locations, channel, dir_out = "./") {
  
  for (i in 1:length(locations)){
    print(locations[i])
    if (locations[i] == "RACEBASE.HAUL") { # that way I can also extract TIME
      
      a<-RODBC::sqlQuery(channel, paste0("SELECT * FROM ", locations[i]))
      
      a<-RODBC::sqlQuery(channel, 
                         paste0("SELECT ",
                                paste0(names(a)[names(a) != "START_TIME"], 
                                       sep = ",", collapse = " "),
                                " TO_CHAR(START_TIME,'MM/DD/YYYY HH24:MI:SS') START_TIME  FROM ", 
                                locations[i]))
    } else {
      a<-RODBC::sqlQuery(channel, paste0("SELECT * FROM ", locations[i]))
    }
    
    filename <- tolower(gsub(x = locations[i], 
                             pattern = ".", 
                             replacement = "_", 
                             fixed = TRUE))
    
    write.csv(x=a, 
              paste0(dir_out,
                     filename,
                     ".csv"))
    remove(a)
  }
}


#' Upload new tables to oracle
#'
#' @param file_paths 
#' @param metadata_column A data.frame of all possible column metadata your tables will need affixed. 
#' @param channel Establish your oracle connection using a function like oracle_connect. 
#' @param schema Character. The name of the schema these tables should be saved to. 
#' @param update_table T/F. Default = TRUE. Save or drop and save the table in Oracle. 
#' @param update_metadata T/F. Default = TRUE. Add table and column metadata to the tables. 
#' @param share_with_all_users T/F. Default = TRUE. Give all users in oracle view permissions. 
#'
#' @return
#' @export
#'
#' @examples
#' # Not run: 
#' # channel <- oracle_connect()
#' # write.csv(x = data.frame(dummy = "blah blah"), 
#' #          file = "./dummy.csv")
#' # metadata_column <- data.frame(
#' #   colname = "dummy", # name of column 
#' #   colname_desc = "Dummy", #  long name of column
#' #   units = "text", # units the column is in
#' #   desc = "Dummy example column") #  description of column
#' # file_paths <- data.frame(file_path = "./dummy.csv", 
#' #                          table_metadata = Sys.Date())
#' # oracle_upload <- function(
#' #     file_paths = file_paths, 
#' #     metadata_column = metadata_column, 
#' #     channel = channel,
#' #     schema = "GAP_PRODUCTS",  
#' #     update_table = TRUE, 
#' #     update_metadata = TRUE,
#' #     share_with_all_users = TRUE)
oracle_upload <- function(
    file_paths, 
    metadata_column, 
    channel, 
    schema, 
    update_table = TRUE, 
    update_metadata = TRUE,
    share_with_all_users = TRUE) {
  
  metadata_column$metadata_colname <- toupper(metadata_column$metadata_colname)
  
  all_schemas <- RODBC::sqlQuery(channel = channel,
                                 query = paste0('SELECT * FROM all_users;'))
  
  # Loop through each table to add to oracle -------------------------------------
  
  for (ii in 1:nrow(file_paths)) {
    
    print(file_paths$file_path[ii])
    file_name <- trimws(toupper(file_paths$file_path[ii]))
    file_name <- strsplit(x = file_name, split = "/", fixed = TRUE)[[1]]
    file_name <- strsplit(x = file_name[length(file_name)], split = ".", fixed = TRUE)
    file_name <- file_name[[1]][1]
    
    a <- read.csv(file_paths$file_path[ii])
    names(a) <- toupper(names(a))
    assign(x = file_name, value = a)
    
    names(a) <- toupper(names(a))
    
    if (update_table) {
      
      ## Drop old table from oracle -------------------------------------------------
      # if the table is currently in the schema, drop the table before re-uploading
      if (file_name %in% 
          unlist(RODBC::sqlQuery(channel = channel, 
                                 query = "SELECT table_name FROM user_tables;"))) {
        RODBC::sqlDrop(channel = channel,
                       sqtable = file_name)
      }
      
      ## Add the table to the schema ------------------------------------------------
      eval( parse(
        text = paste0("RODBC::sqlSave(channel = channel,
                 dat = ",file_name,")") ))
    }
    
    if (update_metadata) {
      ## Add column metadata --------------------------------------------------------
      metadata_column0 <- metadata_column[which(metadata_column$metadata_colname %in% names(a)),]
      if (nrow(metadata_column0)>0) {
        for (i in 1:nrow(metadata_column0)) {
          
          desc <- gsub(pattern = "<sup>2</sup>",
                       replacement = "2",
                       x = metadata_column0$metadata_colname_long[i], fixed = TRUE)
          short_colname <- gsub(pattern = "<sup>2</sup>", replacement = "2",
                                x = metadata_column0$metadata_colname[i], fixed = TRUE)
          
          RODBC::sqlQuery(channel = channel,
                          query = paste0('comment on column ',schema,'.',file_name,'.',
                                         short_colname,' is \'',
                                         desc, ". ", # remove markdown/html code
                                         gsub(pattern = "'", replacement ='\"',
                                              x = metadata_column0$metadata_colname_desc[i]),'\';'))
          
        }
      }
      ## Add table metadata ---------------------------------------------------------
      RODBC::sqlQuery(channel = channel,
                      query = paste0('comment on table ',schema,'.', file_name,
                                     ' is \'',
                                     file_paths$table_metadata[ii],'\';'))
    }
    ## grant access to all schemes ------------------------------------------------
    for (iii in 1:length(sort(all_schemas$USERNAME))) {
      RODBC::sqlQuery(channel = channel,
                      query = paste0('grant select on ',schema,'.',file_name,
                                     ' to ', all_schemas$USERNAME[iii],';'))
    }
    
  }
}

#' Download oracle table and column metadata
#'
#' @return
#' @export
#'
#' @examples
#' # Not run: 
#' # locations <- c("RACEBASE", "RACEDATA")
#' # channel <- oracle_connect()
#' # oracle_dl_metadata(locations, channel)
oracle_dl_metadata <- function(
    locations, 
    channel, 
    dir_out = "./") {
  
  a_col <- data.frame()
  a_table <- data.frame()
  
  for (i in 1:length(locations)) {
    
    loc <- trimws(toupper(locations[i]))
    print(loc)
    
    # --TABLE METADATA QUIERY FROM NANCY
    # SELECT
    # table_name,
    # comments
    # FROM
    # all_tab_comments
    # WHERE
    # owner = 'RACEBASE'
    # AND comments IS NOT NULL
    # AND comments NOT LIKE '%without metadata%'
    # ORDER BY
    # table_name ASC
    
    a <- RODBC::sqlQuery(channel = channel, 
                         query = paste0("SELECT table_name, comments FROM all_tab_comments WHERE owner = '",
                                        loc,"' ORDER BY table_name")) # AND comments IS NOT NULL AND comments NOT LIKE '%without metadata%'  ASC
    
    # a <- RODBC::sqlQuery(channel = channel, query = paste0("SELECT
    # table_name, ",locations[i],"
    # FROM
    # user_tables
    # ORDER BY
    # owner, table_name"))
    
    a_col <- dplyr::bind_rows(a_col, 
                              a %>% 
                                dplyr::mutate(schema = loc))
    
    
    # Download Oracle Data Table information ---------------------------------------
    
    # -COLUMN METDATA QUIERY FROM NANCY
    # SELECT DISTINCT
    # ( table_name ),
    # comments
    # FROM
    # all_col_comments
    # WHERE
    # owner = 'RACEBASE'
    # AND comments IS NOT NULL
    # AND table_name LIKE '%_ORIG%'
    # GROUP BY
    # table_name,
    # comments
    # ORDER BY
    # table_name ASC
    
    a <- RODBC::sqlQuery(channel = channel, 
                         query = paste0("SELECT DISTINCT ( table_name ), comments FROM all_col_comments WHERE owner = '",
                                        loc,"' AND comments IS NOT NULL GROUP BY table_name, comments ORDER BY table_name ASC"))
    
    a_table <- dplyr::bind_rows(a_table, 
                                a %>% 
                                  dplyr::mutate(schema = loc))
    
  }
  
  write.csv(x = unique(a_col), 
            file = paste0(dir_out, "/metadata_column_current.csv"))
  write.csv(x = unique(a_table), 
            file = paste0(dir_out, "/metadata_table_current.csv"))
  
}


