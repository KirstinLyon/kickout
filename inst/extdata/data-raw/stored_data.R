data_representing_map <-

tibble::tribble(
                               ~representing, ~country,                            ~club,
                    "Aars Gymnastikforening",    "DEN",         "Aars Gymnastikforening",
         "DEN, Greve Gymnastik og Trampolin",    "DEN",   "Greve Gymnastik og Trampolin",
                                     "Greve",    "DEN",   "Greve Gymnastik og Trampolin",
              "Greve Gymnastik og Trampolin",    "DEN",   "Greve Gymnastik og Trampolin",
                                       "GTA",    "DEN",                            "GTA",
                                     "GTA20",    "DEN",                          "GTA20",
                            "DEN, Haslev TT",    "DEN",                      "Haslev TT",
                            "DEN, HASLEV TT",    "DEN",                      "Haslev TT",
         "Haslev Trampolin og Turngymnaster",    "DEN",                      "Haslev TT",
    "Haslev Trampolin og Turngymnaster (TT)",    "DEN",                      "Haslev TT",
                                 "Haslev TT",    "DEN",                      "Haslev TT",
                              "Haslev T. T.",    "DEN",                      "Haslev TT",
                                 "HASLEV TT",    "DEN",                      "Haslev TT",
                         "Højby Skytte & GF",    "DEN",              "Højby Skytte & GF",
                                 "Højby SOG",    "DEN",              "Højby Skytte & GF",
                        "DEN, IK Skovbakken",    "DEN",      "IK Skovbakken - Trampolin",
              "DEN, IK Skovbakken Trampolin",    "DEN",      "IK Skovbakken - Trampolin",
                 "IK Skovbakken - Trampolin",    "DEN",      "IK Skovbakken - Trampolin",
                   "IK Skovbakken Trampolin",    "DEN",      "IK Skovbakken - Trampolin",
       "DEN, Jelling Forenede Sportsklubber",    "DEN", "Jelling Forenede Sportsklubber",
            "Jelling Forenede Sportsklubber",    "DEN", "Jelling Forenede Sportsklubber",
                "Copenhagen Trampoline Club",    "DEN",                            "KTK",
           "DEN, Copenhagen Trampoline Club",    "DEN",                            "KTK",
             "DEN, Københavns Trampolinklub",    "DEN",                            "KTK",
                  "Københavns Trampolinklub",    "DEN",                            "KTK",
                                       "KTK",    "DEN",                            "KTK",
                                "KTKs Damer",    "DEN",                            "KTK",
                   "Lundtofte Trampolinklub",    "DEN",        "Lundtofte Trampolinklub",
                  "DEN, OGF Trampoline Team",    "DEN",      "Odense Gymnastik Forening",
                 "Odense Gymnastik Forening",    "DEN",      "Odense Gymnastik Forening",
                                       "OGF",    "DEN",      "Odense Gymnastik Forening",
                                   "Ollerup",    "DEN",                        "Ollerup",
                     "DEN, Rishøj Trampolin",    "DEN",               "Rishøj Trampolin",
                                 "Rishøj IF",    "DEN",               "Rishøj Trampolin",
           "DEN, Roskilde Gymnastikforening",    "DEN",     "Roskilde Gymnastikforening",
                               "Roskilde GF",    "DEN",     "Roskilde Gymnastikforening",
                "Roskilde Gymnastikforening",    "DEN",     "Roskilde Gymnastikforening",
                               "Slagelse GF",    "DEN",                    "Slagelse GF",
                                "De 3 jyder",    "DEN",         "Springteam Nordjylland",
               "DEN, Springteam Nordjylland",    "DEN",         "Springteam Nordjylland",
                    "Springteam Nordjylland",    "DEN",         "Springteam Nordjylland",
                                       "STN",    "DEN",         "Springteam Nordjylland",
                              "Stillinge IF",    "DEN",                   "Stillinge IF",
                      "DEN, Strib Trampolin",    "DEN",     "Strib Udspring & Trampolin",
                                     "Strib",    "DEN",     "Strib Udspring & Trampolin",
                "Strib Udspring & Trampolin",    "DEN",     "Strib Udspring & Trampolin",
                           "Strib Trampolin",    "DEN",     "Strib Udspring & Trampolin",
                             "DEN, Team Fyn",    "DEN",                       "Team Fyn",
                                  "Team Fyn",    "DEN",                       "Team Fyn",
                                     "TGA20",    "DEN",                          "TGA20",
                                     "Vejen",    "DEN",                       "Vejen GF",
                                  "Vejen GF",    "DEN",                       "Vejen GF"
    )





usethis::use_data(data_representing_map, overwrite = TRUE)


data_name_club_map <-
tibble::tribble(
             ~name, ~country,                       ~club,
         "Teis Petersen",    "DEN",                 "Haslev TT",
     "Valdemar Johansen",    "DEN", "IK Skovbakken - Trampolin",
    "Smilla Thea Jensen",    "DEN",                       "KTK",
       "Aksel Koldkjaer",    "DEN",    "Springteam Nordjylland"
    )



usethis::use_data(data_name_club_map, overwrite = TRUE)

data_name_variation_map <-
tibble::tribble(
                              ~name,                          ~name_1,
                    "Smilla Jensen",             "Smilla Thea Jensen",
    "Alvilde Vega Scwartz-Petersen", "Alvilde Vega Schwartz-Petersen",
         "Emilie Schwartz-Petersen",    "Emilie My Schwartz-Petersen",
                     "Gustav Bruun",           "Gustav Heebøll Bruun",
          "Johannes Bovien Nörfelt",        "Johannes Bovien Nørfelt",
                 "Johannes Nørfelt",        "Johannes Bovien Nørfelt",
               "Storm Scotte Höjlo",             "Storm Skotte Højlo",
                    "Vanilla Søkær",                 "Vanilla Søkjær",
                      "Smilla Beck",            "Smilla Vinding Beck",
                      "Storm Højlo",             "Storm Skotte Højlo",
                   "Villads Nemeth",        "Villads Hilstrup Nemeth"
    )

usethis::use_data(data_name_variation_map, overwrite = TRUE)


