#' Return the CSV file of one event cleaned
#'
#' @param id id of an event
#' @param e_list list of events as a tibble
#'
#' @returns tibble of a csv
#' @export
#'
#' @examples
#'  \dontrun{
#'    fetch_event_url(id)
#' }

fetch_event_url <- function(id, e_list){

    link_start <- "https://sporttech.io/events/"
    link_end <- "/ovs/api/event/export"

    event_id = paste0(link_start, id, link_end)

    temp <- readr::read_csv(event_id, col_types = readr::cols(.default = "c")) |>
        kickout::process_event() |>
        dplyr::left_join(e_list, by = c("event_uuid" = "event_id")) |>
        dplyr::select(-c(sport, end_date, en_name)) |>
        dplyr::rename(date = begin_date)

    return(temp)
}
