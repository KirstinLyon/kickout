data_representing_map <-

tibble::tribble(
                               ~representing, ~country,                               ~club,
                    "Aars Gymnastikforening",    "DEN",            "Aars Gymnastikforening",
           "DEN, Copenhagen Trampoline Club",    "DEN",          "Københavns Trampolinklub",
         "DEN, Greve Gymnastik og Trampolin",    "DEN",      "Greve Gymnastik og Trampolin",
                            "DEN, Haslev TT",    "DEN", "Haslev Trampolin og Turngymnaster",
                        "DEN, IK Skovbakken",    "DEN",         "IK Skovbakken - Trampolin",
                     "DEN, Rishøj Trampolin",    "DEN",                  "Rishøj Trampolin",
           "DEN, Roskilde Gymnastikforening",    "DEN",        "Roskilde Gymnastikforening",
               "DEN, Springteam Nordjylland",    "DEN",            "Springteam Nordjylland",
                             "DEN, Team Fyn",    "DEN",                          "Team Fyn",
              "Greve Gymnastik og Trampolin",    "DEN",      "Greve Gymnastik og Trampolin",
                                       "GTA",    "DEN",                               "GTA",
                                     "GTA20",    "DEN",                             "GTA20",
         "Haslev Trampolin og Turngymnaster",    "DEN", "Haslev Trampolin og Turngymnaster",
    "Haslev Trampolin og Turngymnaster (TT)",    "DEN", "Haslev Trampolin og Turngymnaster",
                                 "Haslev TT",    "DEN", "Haslev Trampolin og Turngymnaster",
                         "Højby Skytte & GF",    "DEN",                 "Højby Skytte & GF",
                 "IK Skovbakken - Trampolin",    "DEN",         "IK Skovbakken - Trampolin",
            "Jelling Forenede Sportsklubber",    "DEN",    "Jelling Forenede Sportsklubber",
                  "Københavns Trampolinklub",    "DEN",          "Københavns Trampolinklub",
                   "Lundtofte Trampolinklub",    "DEN",           "Lundtofte Trampolinklub",
                 "Odense Gymnastik Forening",    "DEN",         "Odense Gymnastik Forening",
                                       "OGF",    "DEN",         "Odense Gymnastik Forening",
                                   "Ollerup",    "DEN",                           "Ollerup",
                                 "Rishøj IF",    "DEN",                  "Rishøj Trampolin",
                "Roskilde Gymnastikforening",    "DEN",        "Roskilde Gymnastikforening",
                               "Slagelse GF",    "DEN",                       "Slagelse GF",
                    "Springteam Nordjylland",    "DEN",            "Springteam Nordjylland",
                              "Stillinge IF",    "DEN",                      "Stillinge IF",
                                     "Strib",    "DEN",        "Strib Udspring & Trampolin",
                "Strib Udspring & Trampolin",    "DEN",        "Strib Udspring & Trampolin",
                                     "TGA20",    "DEN",                             "TGA20",
                                  "Vejen GF",    "DEN",                          "Vejen GF"
    )

usethis::use_data(data_representing_map, overwrite = TRUE)
