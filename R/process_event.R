#' Process an individual event
#'
#' @param event tibble of a competition
#'
#' @returns a tibble of all scores for a single competition
#' @export
#'
#' @examples
#'  \dontrun{
#'    process_event(event)
#' }
process_event <- function(event) {
    temp <- event |>
        janitor::clean_names() |>
        dplyr::filter(discipline %in% c("TRA", "SYN"),
                      !stringr::str_detect(competition, "Test|TEST"),
        ) |>

        #convert Esigma to e_sigma
        dplyr::mutate(judge = dplyr::case_when(
            grepl("^E.*[^\\x00-\\x7F]$", judge) ~ "e_sigma",
            TRUE ~ judge
        )) |>
        dplyr::filter(judge %in% c("T", "D", "H", "e_sigma")) |>
        dplyr::mutate(
            name = paste(given_panel_name, surname),
            name = stringr::str_squish(name),
            name = stringr::str_to_title(name)
        ) |>
        dplyr::select(
            -c(
                subtitle,
                number,
                time,
                code,
                external_id,
                date_of_birth,
                sex,
                given_panel_name,
                surname,
                ranked,
                team,
                team_rank,
                team_mark
            )
        ) |>

        dplyr::mutate(
            unique_id = paste(
                discipline,
                competition,
                stage,
                group_number,
                performance_number,
                routine_number,
                name,
                sep = "_"
            )
        )

    execution_score <- temp |>
        dplyr::filter(judge == "e_sigma")

    other_scores <- temp |>
        dplyr::select(judge, x, unique_id) |>
        dplyr::filter(judge != "e_sigma") |>
        tidyr::pivot_wider(names_from = judge, values_from = x)


    complete_score <- execution_score |>
        dplyr::left_join(other_scores, by = "unique_id") |>
        dplyr::select(-c(judge, unique_id)) |>
        dplyr::rename(execution = x)

    return(complete_score)
}
