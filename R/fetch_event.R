#' Return the CSV file of one event
#'
#' @param id id of an event
#'
#' @returns tibble of a csv
#' @export
#'
#' @examples
#'  \dontrun{
#'    fetch_event(id)
#' }

fetch_event <- function(id){
    temp <- readr::read_csv(event_id, col_types = readr::cols(.default = "c"))
    return(temp)
}
