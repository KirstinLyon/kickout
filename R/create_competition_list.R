#Title: Create competition list
#AUTHOR: Kirstin Lyon
#DESCRIPTION: Returns a list of all competitions available on the URL
#DATE:2025-03-29
#LICENSE: MIT

#' create_competition_list
#'
#' @param URL URL for website
#'
#' @returns a list of all events
#' @export
#'
#' @examples
#'  \dontrun{
#'    create_competition_list(url)
#' }
create_competition_list <- function(URL){

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

