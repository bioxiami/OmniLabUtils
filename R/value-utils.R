#' input is null, na, or empty string
#'
#' @param input
#'
#' @returns bool
#' @export
#'
#' @examples isValueEmpty(x)
isValueEmpty <- function(input) {
  if (is.null(input)) {
    return(TRUE)
  }
  if (is.na(input)) {
    return(TRUE)
  }
  return("" == input)
}
