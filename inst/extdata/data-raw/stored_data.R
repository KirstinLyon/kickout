data_representing_map <-

tibble::tribble(
                               ~representing, ~country,                               ~club,
                    "Aars Gymnastikforening",    "DEN",            "Aars Gymnastikforening",
                "Copenhagen Trampoline Club",    "DEN",          "Københavns Trampolinklub",
                                "De 3 jyder",    "DEN",            "Springteam Nordjylland",
           "DEN, Copenhagen Trampoline Club",    "DEN",          "Københavns Trampolinklub",
         "DEN, Greve Gymnastik og Trampolin",    "DEN",      "Greve Gymnastik og Trampolin",
                            "DEN, Haslev TT",    "DEN", "Haslev Trampolin og Turngymnaster",
                        "DEN, IK Skovbakken",    "DEN",         "IK Skovbakken - Trampolin",
             "DEN, Københavns Trampolinklub",    "DEN",          "Københavns Trampolinklub",
                  "DEN, OGF Trampoline Team",    "DEN",         "Odense Gymnastik Forening",
                     "DEN, Rishøj Trampolin",    "DEN",                  "Rishøj Trampolin",
           "DEN, Roskilde Gymnastikforening",    "DEN",        "Roskilde Gymnastikforening",
               "DEN, Springteam Nordjylland",    "DEN",            "Springteam Nordjylland",
                             "DEN, Team Fyn",    "DEN",                          "Team Fyn",
                            "DEN, HASLEV TT",    "DEN", "Haslev Trampolin og Turngymnaster",
              "DEN, IK Skovbakken Trampolin",    "DEN",         "IK Skovbakken - Trampolin",
       "DEN, Jelling Forenede Sportsklubber",    "DEN",    "Jelling Forenede Sportsklubber",
                      "DEN, Strib Trampolin",    "DEN",        "Strib Udspring & Trampolin",
                                     "Greve",    "DEN",      "Greve Gymnastik og Trampolin",
              "Greve Gymnastik og Trampolin",    "DEN",      "Greve Gymnastik og Trampolin",
                                       "GTA",    "DEN",                               "GTA",
                                     "GTA20",    "DEN",                             "GTA20",
         "Haslev Trampolin og Turngymnaster",    "DEN", "Haslev Trampolin og Turngymnaster",
    "Haslev Trampolin og Turngymnaster (TT)",    "DEN", "Haslev Trampolin og Turngymnaster",
                                 "Haslev TT",    "DEN", "Haslev Trampolin og Turngymnaster",
                              "Haslev T. T.",    "DEN", "Haslev Trampolin og Turngymnaster",
                                 "HASLEV TT",    "DEN", "Haslev Trampolin og Turngymnaster",
                         "Højby Skytte & GF",    "DEN",                 "Højby Skytte & GF",
                                 "Højby SOG",    "DEN",                 "Højby Skytte & GF",
                 "IK Skovbakken - Trampolin",    "DEN",         "IK Skovbakken - Trampolin",
                   "IK Skovbakken Trampolin",    "DEN",         "IK Skovbakken - Trampolin",
            "Jelling Forenede Sportsklubber",    "DEN",    "Jelling Forenede Sportsklubber",
                  "Københavns Trampolinklub",    "DEN",          "Københavns Trampolinklub",
                                       "KTK",    "DEN",          "Københavns Trampolinklub",
                                "KTKs Damer",    "DEN",          "Københavns Trampolinklub",
                   "Lundtofte Trampolinklub",    "DEN",           "Lundtofte Trampolinklub",
                 "Odense Gymnastik Forening",    "DEN",         "Odense Gymnastik Forening",
                                       "OGF",    "DEN",         "Odense Gymnastik Forening",
                                   "Ollerup",    "DEN",                           "Ollerup",
                                 "Rishøj IF",    "DEN",                  "Rishøj Trampolin",
                               "Roskilde GF",    "DEN",        "Roskilde Gymnastikforening",
                "Roskilde Gymnastikforening",    "DEN",        "Roskilde Gymnastikforening",
                               "Slagelse GF",    "DEN",                       "Slagelse GF",
                    "Springteam Nordjylland",    "DEN",            "Springteam Nordjylland",
                              "Stillinge IF",    "DEN",                      "Stillinge IF",
                                       "STN",    "DEN",            "Springteam Nordjylland",
                                     "Strib",    "DEN",        "Strib Udspring & Trampolin",
                "Strib Udspring & Trampolin",    "DEN",        "Strib Udspring & Trampolin",
                           "Strib Trampolin",    "DEN",        "Strib Udspring & Trampolin",
                                  "Team Fyn",    "DEN",                          "Team Fyn",
                                     "TGA20",    "DEN",                             "TGA20",
                                     "Vejen",    "DEN",                          "Vejen GF",
                                  "Vejen GF",    "DEN",                          "Vejen GF"
    )




usethis::use_data(data_representing_map, overwrite = TRUE)


data_name_club_map <-
tibble::tribble(
                  ~name, ~country,          ~name_other,                               ~club,
        "Teis Petersen",    "DEN",      "Teis Petersen", "Haslev Trampolin og Turngymnaster",
    "Valdemar Johansen",    "DEN",  "Valdemar Johansen",         "IK Skovbakken - Trampolin",
        "Smilla Jensen",    "DEN", "Smilla Thea Jensen",          "Københavns Trampolinklub",
      "Aksel Koldkjaer",    "DEN",    "Aksel Koldkjaer",            "Springteam Nordjylland"
    )

usethis::use_data(data_name_club_map, overwrite = TRUE)

