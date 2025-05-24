# kickout

kickout is an R package designed to process trampoline competition data from sporttech.io. This package provides tools to efficiently handle and process competition data, making it easier for users to work with trampoline-related datasets.

## Installation

You can install the development version of kickout from GitHub with:

``` r
# Install the remotes package if you haven't already

install.packages("remotes")

# Install the kickout package

remotes::install_github("KirstinLyon/kickout")
```

## Usage

Here is a basic example of how to use kickout:

``` r
library(kickout)

# Load and process the list of trampoline events.  Can select from the following:  

# Trampoline
# Rhythmic gymnastics
# TeamGym
# Snowboard
# Artistic gymnastics
# Aerobics
# Acrobatics


event_list <- kickout::fetch_past_event_list() |> 
    kickout::process_event_list("Trampoline")

# fetch all data based on your list and process it.  Disciplines are:

# For Trampoline: TRA, SYN, DMT, TUM  (individual, synchromised, Doublt Mini Trampoline, Tumbling)
# For Rhythmic Gymnastics: IND, GROUP  (Individual, Group)
# for TeamGym:  TEAM
# For Snowboard:BA, HP, SS (Big air, Half pipe, Slope style, )
# For Artistic gymnastics: TEAM, WAG, MAG (Team, Women, Men)
# For Aerobics: IND, MXP, TRI, DG, GROUP (Individual, Mixed Pairs, Trio, Dance gymnastics, Group)
# For Acrobatics:WP, MP, MXP, WG, MG, TEAM (Women pairs, Men pairs, Mixed pairs, Women group, Men group, Team)

events <- purrr::map(event_list$event_id, ~ kickout::fetch_event_url(.x, event_list     , DISCIPLINE)) |>
    bind_rows()

# If you have downloaded a csv file from sporttech.io, you can use this to process it
my_event <- fetch_event_local("my_file.csv")


# Print the results

glimpse(events)
```

## Features

**Data Loading**: Easily load trampoline competition data from CSV files.

**Data Processing:** Clean and process the data to make it ready for analysis.

## License

This package is licensed under the MIT License. See the LICENSE file for details.
