#' Create a club and country based on representing column
#'
#' @param representing column from sporttech.  Can contain country, club or both country and club
#' @param title title of the event
#' @param col 1 or 2.  1 for country and 2 for club
#'
#' @returns dataset with representing, country and club
#' @export
#'
#' @examples
#'  \dontrun{
#'    clean_representing(representing, title, col)
#' }
clean_representing <- function(representing, title, col) {
    rep_type <- dplyr::case_when(
        stringr::str_detect(representing, ",") ~ "country_club",
        stringr::str_detect(title, "FIG") ~ "country",
        TRUE ~ "club"
    )

    country <- dplyr::case_when(
        rep_type == "country" ~ representing,
        rep_type == "country_club" ~ stringr::str_split_i(representing, ",", 1),
        TRUE ~ "unknown"
    )

    club <- dplyr::case_when(
        rep_type == "club" ~ representing,
        rep_type == "country_club" ~ stringr::str_split_i(representing, ", ", 2),
        TRUE ~ "unknown"
    )

    if(col == 1)
        return (country)
    else
        return(club)

}

