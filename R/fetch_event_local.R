#' Return the CSV file of one event
#'
#' @param file ilocal file in csv format from sporttech.io
#'
#' @returns tibble of a csv
#' @export
#'
#' @examples
#'  \dontrun{
#'    fetch_event_local(file)
#' }

fetch_event_local <- function(file){

    temp <- readr::read_csv(file, col_types = readr::cols(.default = "c"))

    return(temp)
}
