#' input is null or empty string
#'
#' @param input
#'
#' @returns bool
#' @export
#'
#' @examples isStringBlank(aaa)
isStringBlank <- function(input) {
  if (is.null(input)) {
    return(TRUE)
  }
  return("" == input)
}
