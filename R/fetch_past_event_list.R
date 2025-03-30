#Title: fetch past event list
#AUTHOR: Kirstin Lyon
#DESCRIPTION: Returns a list of all competitions available on the URL
#DATE:2025-03-29
#LICENSE: MIT

#' create a list of held competitions from Sporttech.io
#'
#' @returns a list of all events
#' @export
#'
#' @examples
#'  \dontrun{
#'    fetch_past_event_list()
#' }
fetch_past_event_list <- function(){

    API_URL <- "http://sporttech.io/api/events/"

    response <- httr::GET(API_URL)

    if(httr::http_type(response) == "application/json"){
        temp <- httr::content(response, as = "text") |>
            jsonlite::fromJSON()

        all_events <- temp$event

        return(all_events)
    }else{
        print("no such URL")
    }

}

