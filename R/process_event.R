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
        dplyr::left_join(other_scores, by = "unique_id") |>
        dplyr::select(-c(judge, unique_id)) |>
        dplyr::rename(execution = x) |>
        dplyr::mutate(

            execution = dplyr::case_when(discipline == "TRA" ~ as.numeric(execution)/10,
                                         TRUE ~ as.numeric(execution)),
            T = dplyr::case_when(discipline == "TRA" ~  as.numeric(T)/1000,
                                 TRUE ~ as.numeric(T)),
            mark_total = dplyr::case_when(discipline == "TRA" ~ as.numeric(mark_total)/ 1000,
                                          TRUE ~ as.numeric(mark_total)),
            mark = dplyr::case_when(discipline == "TRA" ~ as.numeric(mark)/ 1000,
                                    TRUE ~ as.numeric(mark)),
            H = dplyr::case_when(discipline == "TRA" ~ as.numeric(H)/10,
                                 TRUE ~ as.numeric(H)),
            H = H / 10,
            D = dplyr::case_when(discipline  == "TRA" ~ as.numeric(D)/10,
                                 TRUE ~ as.numeric(D))
        )

    return(complete_score)
}
