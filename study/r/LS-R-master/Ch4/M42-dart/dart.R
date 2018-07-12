loadDART <- function(start_dt = Sys.Date()-3, end_dt = Sys.Date()-1) {
  # loadDART()
  # 0. setup environment  
  source("../../LSR.R")
  activate("dplyr", "jsonlite")
  # 1. setup API
  svc_key <- "f96deaa9b5f380145bc2d57eddc9b8b0a8c358b4"
  url     <- "http://dart.fss.or.kr/api/search.json"
  # 2. get maxPage
  fields <- c("auth", "start_dt", "end_dt", "page_set")
  values <- c(svc_key, 
              format(start_dt,"%Y%m%d"),
              format(end_dt,"%Y%m%d"),
              100)
  request <- paste(fields, values, sep = "=") %>% paste(collapse="&")
  query   <- paste0(url, "?", request)
  raw     <- readLines(query, warn = "F", encoding = "UTF-8") %>% fromJSON()
  maxPage <- raw$total_page
  # 3. collect all pages  
  fields <- c(fields, "page_no")
  dataset <- data.frame()
  for (i in 1:maxPage) {
    values_i  <- c(values, i)
    request_i <- paste(fields, values_i, sep = "=") %>% paste(collapse="&")
    query_i   <- paste0(url, "?", request_i)
    raw_i     <- readLines(query_i, warn = "F", encoding = "UTF-8") %>% fromJSON()
    dataset_i <- raw_i$list
    dataset   <- rbind(dataset, dataset_i)
  }
  # 4. deliver output
  return(dataset)
}

dartLookup <- function(dartObj, keyword) {
  # loadDART() %>% dartLookup("합병")
  selects <- which(grepl(keyword, dartObj[,4]))
  deliver <- dartObj[selects, c(7,2,4,3,6,5)]
  return(data.frame(deliver, stringsAsFactors = FALSE))
}

