GameCompany.destroy_all
GameCompany.reset_pk_sequence
VideoGame.destroy_all
VideoGame.reset_pk_sequence
Garden.destroy_all
Garden.reset_pk_sequence
Plant.destroy_all
Plant.reset_pk_sequence

bethesda = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
small_indie_studio = GameCompany.create!(title: "Small Indie Studio", profitable: false, employees: 25)
riot_games = GameCompany.create!(title: "Riot Games", profitable: true, employees: 500000)
front_yard = Garden.create!(name: "Front Yard", watered: false, max_plant_capacity: 10)
back_yard = Garden.create!(name: "Back Yard", watered: true, max_plant_capacity: 25)
grandmas_yard = Garden.create!(name: "Grandmas Yard", watered: true, max_plant_capacity: 100)


bethesda.video_games.create!(name:        "Skyrim",
                             max_players: 500000,
                             is_live:     false)
bethesda.video_games.create!(name:        "Fallout",
                             max_players: 2300000,
                             is_live:     false)
small_indie_studio.video_games.create!(name:        "Super Meatboy",
                                       max_players: 350,
                                       is_live:     false)
small_indie_studio.video_games.create!(name:        "Among Us",
                                       max_players: 10000,
                                       is_live:     true)
riot_games.video_games.create!(name:        "League of Legends",
                               max_players: 10000000,
                               is_live:     true)
riot_games.video_games.create!(name:        "Valorant",
                               max_players: 60000000,
                               is_live:     true)

front_yard.plants.create!(name:        "Red Rose",
                          age:         5,
                          in_season:   true)
front_yard.plants.create!(name:      "Benca",
                          age:       10,
                          in_season: false)
back_yard.plants.create!(name:        "Purple Tulip",
                         age:         7,
                         in_season:   true)
back_yard.plants.create!(name:        "Blue Rose",
                         age:         9,
                         in_season:   true)
grandmas_yard.plants.create!(name:        "Red Tulip",
                             age:         11,
                             in_season:   false)
grandmas_yard.plants.create!(name:        "Blue Tulip",
                             age:         2,
                             in_season:   false)
