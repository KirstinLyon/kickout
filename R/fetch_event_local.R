#' Return the CSV file of one event cleaned
#'
#' @param file a local file in csv format from sporttech.io
#' @param discipline_type Discipline type, e.g. "TRA" of "SYN"
#'
#' @returns tibble of a csv
#' @export
#'
#' @examples
#'  \dontrun{
#'    fetch_event_local(file, discipline_type)
#' }

fetch_event_local <- function(file, discipline_type){

    temp <- readr::read_csv(file, col_types = readr::cols(.default = "c")) |>
        kickout::process_event(discipline_type)

    return(temp)
}

