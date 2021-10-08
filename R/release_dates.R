#' Download release dates of specifict USDA announcements with report pubids
#'
#' This function uses report pubids to download release dates of certian USDA announcements.
#'
#' @param key a string contains an api key for USDA EMSI
#' @param start_date a string represents beginning of the search period in forms of yyyy-mm-dd
#' @param end_date a string represents ending of the search period in form of yyyy-mm-dd
#' @param pubid a string represents the publication id of usda announcements, such as 8336h188j for crop progress
#'
#' @return A dataframe contains release dates and announcement name
#'
#' @examples
#' # Retreive WASDE release dates between 01/02/2009 and 05/22/2018. Replace key with your own api key from key_generator function in this package
#'
#' WASDE_dates <- release_dates(start_date = "2009-01-02",end_date = "2018-05-22",pubid = "3t945q76s",key = key)
#'
#' @export

release_dates <- function(key=key,
                          start_date,end_date,pubid){
  if(!is.character(key)){
    stop("The api key must be a string")
  }
  start_date <- as.Date(start_date)
  end_date <- as.Date(end_date)

  latest <- ifelse(latest,"true","false")

  if(!is.character(pubid)){
    stop("pubid must be a string, such as 3t945q76s")
  }
  url <- paste0("https://usda.library.cornell.edu/api/v1/release/findByPubId/",pubid,
                "?latest=false","&start_date=",start_date,"&end_date=",end_date)

  Results <- httr::RETRY("GET",url=url,httr::add_headers(accept="application/json",Authorization=paste("Bearer",key,sep=" ")),times=5)
  Results <- httr::content(Results,"parsed")
  announcement_dates <- unlist(purrr::map(Results,purrr::pluck,"release_datetime"))
  announcement_name <- unlist(purrr::map(Results,purrr::pluck,"title"))
  announcement_dates <- cbind.data.frame(announcement_dates,announcement_name)

  return(announcement_dates)
}
