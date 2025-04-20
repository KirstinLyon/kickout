#' Return the CSV file of one event cleaned
#'
#' @param id id of an event
#'
#' @returns tibble of a csv
#' @export
#'
#' @examples
#'  \dontrun{
#'    fetch_event_url(id)
#' }

fetch_event_url <- function(id){

    link_start <- "https://sporttech.io/events/"
    link_end <- "/ovs/api/event/export"

    event_id = paste0(link_start, id, link_end)

    temp <- readr::read_csv(event_id, col_types = readr::cols(.default = "c")) |>
        kickout::process_event()
    return(temp)
}
