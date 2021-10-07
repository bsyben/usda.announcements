#' Obtain API key from USDA ESMIS API
#'
#' This function helps user obtain an api token for USDA ESMIS
#'
#' @param user.email a string contains the email used to login your account at https://usda.library.cornell.edu/?locale=en
#' @param user.password a string contains the password used to login your account at https://usda.library.cornell.edu/?locale=en
#'
#' @return A string contains your api token
#'
#' @examples
#'
#' key_generator(user.email="john.smith@example.com",user.password="password")
#'
#' @export

key_generator <- function(user.email,user.password){

  if(!is.character(user.email)){
    stop("The user email must be a string such as 'john.smith@example.com'")
  }

  if(!is.character(user.password)){
    stop("The user password must be a string such as 'password'")
  }


  auth = list(auth=list(
    email=user.email,
    password=user.password)
  )

  request <-  httr::POST(url="https://usda.library.cornell.edu/user_token",
       body=jsonlite::toJSON(auth, pretty = T, auto_unbox = T), httr::content_type('application/json'))
  key <- httr::content(request,"parsed")$jwt

  return(key)
}





