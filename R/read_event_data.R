#Title: Read event data
#AUTHOR: Kirstin Lyon
#DESCRIPTION: Read event data
#DATE:2025-03-29
#LICENSE: MIT

#' Read event data
#'
#' @param URL URL for a competition
#'
#' @returns a list of all events
#' @export
#'
#' @examples
#'  \dontrun{
#'    read_all_events_data(url)
#' }
read_all_events_data <- function(URL){

    response <- httr::GET(URL)

    if(httr::http_type(response) == "application/json"){
        temp <- httr::content(response, as = "text") |>
            jsonlite::fromJSON()

        all_events <- temp$event

        return(all_events)
    }else{
        print("no such URL")
    }

}

