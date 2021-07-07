#' Download release dates of specifict USDA announcements with report identifiers
#' 
#' This function uses report identifiers to download release dates of certian USDA announcements.
#' 
#' @param key a string contains an api key for USDA EMSI
#' @param start_date a string represents begining of the search period in forms of yyyy-mm-dd
#' @param end_date a string represents ending of the search period in form of yyyy-mm-dd
#' @param identifier a string represents the abbreviation of usda announcements, such as wasde
#' @param latest a boolean indicator. If latest is set to be TRUE, then only the latest release will be obtained. Default is latest=FALSE
#' 
#' @return A vector contains release dates
#' @export

release_dates <- function(key="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQ3NzJ9.J_iSIoycXn2FhgZzR53rYuyfxNoSE1F6RfhOsaagrAs",start_date,end_date,identifier,latest=F){
  if(!is.character(key)){
    stop("The api key must be a string")
  }
  start_date <- as.Date(start_date) 
  end_date <- as.Date(end_date)
  
  latest <- ifelse(latest,"true","false")
  
  if(!is.character(identifier)){
    stop("identifier must be a string, such as wasde")
  }
  url <- paste0("https://usda.library.cornell.edu/api/v1/release/findByIdentifier/",identifier,
                "?latest=",latest,"&start_date=",start_date,"&end_date=",end_date)
  Results <- httr::GET(url=url,httr::add_headers(accept="application/json",Authorization=paste("Bearer",key,sep=" ")))
  Results <- httr::content(Results,"parsed")
  announcement_dates <- unlist(purrr::map(Results,purrr::pluck,"release_datetime"))
  
  return(announcement_dates)
}