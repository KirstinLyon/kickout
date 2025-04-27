#' Process an individual event
#'
#' @param discipline_type competition discipline e.g. TRA and SYN
#' @param event tibble of a competition
#'
#' @returns a tibble of all scores for a single competition
#' @export
#'
#' @examples
#'  \dontrun{
#'    process_event(event)
#' }
process_event <- function(event, discipline_type) {
    temp <- event |>
        janitor::clean_names() |>
        dplyr::filter(discipline %in% discipline_type,
                      !stringr::str_detect(competition, "Test|TEST"),
        ) |>

        #convert Esigma to e_sigma
        dplyr::mutate(judge = dplyr::case_when(
            grepl("^E.*[^\\x00-\\x7F]$", judge) ~ "e_sigma",
            TRUE ~ judge
        )) |>
        dplyr::filter(judge %in% c("T", "D", "H", "e_sigma")) |>
        dplyr::select(
            -c(
                subtitle,
                number,
                time,
                code,
                external_id,
                sex,
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
                date_of_birth,
                group_number,
                performance_number,
                routine_number,
                given_panel_name,
                surname,
                sep = "_"
            )
        )

    execution_score <- temp |>
        dplyr::filter(judge == "e_sigma")

    T_score <- temp |>
        dplyr::filter(judge == "T") |>
        dplyr::select(unique_id, dplyr::matches("^s\\d+")) |>
        dplyr::rename_with(~ stringr::str_replace(.x, "^s(\\d+)", "t\\1"), dplyr::starts_with("s"))


    other_scores <- temp |>
        dplyr::select(judge, x, unique_id) |>
        dplyr::filter(judge != "e_sigma") |>
        tidyr::pivot_wider(names_from = judge, values_from = x)

    other_scores <- other_scores |>
        dplyr::mutate(
            H = if ("H" %in% colnames(other_scores)) H else NA_character_,
            D = if ("D" %in% colnames(other_scores)) D else NA_character_
        )


    complete_score <- execution_score |>
        dplyr::left_join(T_score, by = "unique_id") |>
        dplyr::left_join(other_scores, by = "unique_id") |>
        dplyr::select(-c(judge, unique_id)) |>
        dplyr::rename(execution = x)

    return(complete_score)
}
