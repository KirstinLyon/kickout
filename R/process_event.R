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
        dplyr::select(
            -c(
                subtitle,
                number,
                time,
                code,
                external_id,
                date_of_birth,
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
                             TRUE ~ as.numeric(mark))
        ) #|>

    #TODO handle when cols are missing

    #these can be missing sometimes - how to fix?
    #        dplyr::mutate(H = dplyr::case_when(discipline == "TRA" ~ as.numeric(H)/10,
    #                                            TRUE ~ as.numeric(H)),
    #                      H = H / 10,
    #                      D = dplyr::case_when(discipline  == "TRA" ~ as.numeric(D)/10,
    #                                           TRUE ~ as.numeric(D)),
    #        )


    #clean names, countries, clubs
    final_data <- complete_score |>
        #update name
        dplyr::mutate(name = dplyr::case_when(title == "DM Senior 2024" ~ paste(surname, given_panel_name, sep = " "),
                                              TRUE ~ paste(given_panel_name, surname, sep = " ")
        ),
        name = stringr::str_to_title(name),
        name = stringr::str_squish(name),
        ) |>
        dplyr::left_join(kickout::data_name_variation_map, by = "name") |>
        dplyr::mutate(name = dplyr::case_when(!is.na(name_1) ~ name_1,
                                              TRUE ~ name
        )) |>
        dplyr::select(-c(name_1, surname, given_panel_name)) |>

        #update club and country

        dplyr::left_join(kickout::data_representing_map, by = "representing") |>
        dplyr::mutate(country = dplyr::case_when(is.na(country) ~ kickout::clean_representing(representing, title,1),
                                                 TRUE ~ country),
                      club = dplyr::case_when(is.na(club) ~ kickout::clean_representing(representing, title,2),
                                              TRUE ~ club)
        ) |>
        dplyr::select(-c(representing)) |>

        #fix names from large international events without a club
        dplyr::left_join(kickout::data_name_club_map, by = "name") |>
        dplyr::mutate(club = dplyr::case_when(!is.na(club_1) ~ club_1,
                                              TRUE ~ club),
                      country = dplyr::case_when(!is.na(country_1) ~ country_1,
                                                 TRUE ~ country)
        ) |>
        dplyr::select(-c(club_1, country_1))


    return(final_data)
}
