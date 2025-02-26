#library(readxl)
#library(dplyr)


##
#' Read many excel files and combine them into a single data frame
#'
#' Combine many excel files into a single data frame. All files must have the
#' same structure. No error checking is done and weird things will happen you
#' break this assumption.
#'
#' @param fnames list of file names
#' @param ... optional parameters passed to readxl::read_excel
#'
#' @returns
#' A data frame with the contents of all the files
#' @export
#'
#' @examples
#' \dontrun{
#' fnames <- c("file1.xlsx", "file2.xlsx", "file3.xlsx")
#' df <- slurp_excel(fnames)
#' }
slurp_excel <- function(fnames, ...) {
  result_list <- lapply(fnames, readxl::read_excel, ...)
  result_df <-  bind_rows(res)
  return(result_df)
}


