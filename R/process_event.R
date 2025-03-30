#' Process and individual event
#'
#' @param file path to a competition file
#'
#' @returns a tibble of all scores
#' @export
#'
#' @examples
#'  \dontrun{
#'    process_event(file)
#' }
process_event <- function(file){

    temp <- readr::read_csv(file, col_types = readr::cols(.default = "c")) |>
        janitor::clean_names() |>
        dplyr::filter(judge %in% c("T", "D", "H", "E\u03A3"),
               discipline == "TRA"
        ) |>
        dplyr::mutate(name = paste(given_name, surname)) |>
        dplyr::select(-c(subtitle, number, time,
                  code, external_id,date_of_birth, sex,
                  given_name, surname, ranked,
                  team, team_rank, team_mark)) |>
        dplyr::mutate(unique_person = paste0(stage, group_number, performance_number,
                                      routine_number, name, discipline, event_uuid))

    execution_score <- temp |>
        dplyr::filter(judge == "E\u03A3")

    other_scores <- temp |>
        dplyr::select(judge, x,unique_person) |>
        dplyr::filter(judge != "E\u03A3") |>
        tidyr::pivot_wider(names_from = judge, values_from = x)


    complete_score <- execution_score |>
        dplyr::left_join(other_scores, by = "unique_person") |>
        dplyr::select(-c(unique_person, judge)) |>
        dplyr::rename(execution = x)

    return(complete_score)
}
