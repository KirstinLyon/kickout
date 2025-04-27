#TITLE: Process event list
#AUTHOR: Kirstin Lyon
#DESCRIPTION: Process the event list and turn it in to a tibble
#LICENSE: MIT
#DATE: 2025-03-29


#' Process_event_list
#'
#' @param event_list list of all trampoline events
#' @param sport_type type of sport, e.g., Trampoline
#'
#' @returns a tibble of all trampoline events
#' @export
#'
#' @examples
#'  \dontrun{
#'    process_event_list(list)
#' }
process_event_list <- function(event_list, sport_type){

    temp <- event_list |>
        purrr::map(~.[c("event_id","en_name", "sport", "rules", "begin_date", "end_date")]) |>
        dplyr::bind_rows() |>
        dplyr::filter(sport == sport_type) |>
        dplyr::mutate(begin_date = lubridate::ymd_hms(begin_date),
                      end_date = lubridate::ymd_hms(end_date),
        ) |>
        dplyr::filter(!is.na(begin_date) & !is.na(end_date)) |>
        dplyr::filter(end_date < Sys.Date())

    return(temp)
}

