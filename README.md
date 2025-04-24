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

# Load and process the list of events

event_list <- kickout::fetch_past_event_list() |> 
    kickout::process_event_list()

# fetch all trampoline and synchronised trampoline data based on your list and add date and rules.

events <- purrr::map(event_list$event_id, ~ kickout::fetch_event_url(.x, event_list)) |>
    bind_rows()

# Print the results

glimpse(events)
```

## Features

**Data Loading**: Easily load trampoline competition data from CSV files.

**Data Processing:** Clean and process the data to make it ready for analysis.

## License

This package is licensed under the MIT License. See the LICENSE file for details.
