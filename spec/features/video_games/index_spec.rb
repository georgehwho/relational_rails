require 'rails_helper'

RSpec.describe "game_companies index page", type: :feature do
  it "can see all video games and their attributes" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                     max_players: 500000,
                                     is_live:     true,
                                     game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                     max_players: 2300000,
                                     is_live:     false,
                                     game_company_id: game_company.id)
    visit "/video_games/"

    expect(page).to have_content(video_game_1.name)
    page.should have_no_content(video_game_2.name)
    expect(page).to have_content("All Live Video Games")
    first(:link, 'Details').click
    expect(page).to have_content(video_game_1.max_players)
    expect(page).to have_content(video_game_1.is_live)
    page.should have_no_content(video_game_2.max_players)
    page.should have_no_content(video_game_2.is_live)
  end

  it "can see selected game company by id's video game collection" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    game_company_2 = GameCompany.create!(title: "Hollywood", profitable: true, employees: 5000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    video_game_3 = VideoGame.create!(name:        "L.A",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company_2.id)
    visit "/game_companies/#{game_company.id}/video_games"

    expect(page).to have_content(game_company.video_games.ids.sort == [video_game_1.id, video_game_2.id])
    expect(page).to have_content(video_game_1.name)
    expect(page).to have_content("Max Player Capacity: #{video_game_1.max_players}")
    expect(page).to have_content("Server is live?: #{video_game_1.is_live}")

    first(:link, 'Details').click

    expect(page).to have_content(video_game_2.name)
    expect(page).to have_content("Max Player Capacity: #{video_game_2.max_players}")
    expect(page).to have_content("Server is live?: #{video_game_2.is_live}")
  end

  it "can redirect to an add video game to current game company page" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    game_company_2 = GameCompany.create!(title: "Hollywood", profitable: true, employees: 5000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    video_game_3 = VideoGame.create!(name:        "L.A",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company_2.id)
    visit "/game_companies/#{game_company.id}/video_games"

    expect(current_path).to eq("/game_companies/#{game_company.id}/video_games")
    expect(page).to have_link("Add New Video Game to this Company")
    click_link "Add New Video Game to this Company"
    expect(current_path).to eq("/game_companies/#{game_company.id}/video_games/new")
  end

  it "can click alphabetize button and redirect refresh with ordered items" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    game_company_2 = GameCompany.create!(title: "Hollywood", profitable: true, employees: 5000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    video_game_3 = VideoGame.create!(name:        "L.A",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company_2.id)
    visit "/game_companies/#{game_company.id}/video_games"

    expect(current_path).to eq("/game_companies/#{game_company.id}/video_games")
    expect(page).to have_link("alphabetize")
    click_link "alphabetize"
    expect(current_path).to eq("/game_companies/#{game_company.id}/video_games")
  end

  it "can see & click edit button on video_games index and game_company/id/video_games and redirect " do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    game_company_2 = GameCompany.create!(title: "Hollywood", profitable: true, employees: 5000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    video_game_3 = VideoGame.create!(name:        "L.A",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company_2.id)
    visit "/game_companies/#{game_company.id}/video_games"

    expect(current_path).to eq("/game_companies/#{game_company.id}/video_games")
    first(:link, 'Edit').click
    expect(current_path).to eq("/video_games/#{video_game_1.id}/edit")

    visit "/video_games/"

    expect(current_path).to eq("/video_games/")
    first(:link, 'Edit').click
    expect(current_path).to eq("/video_games/#{video_game_1.id}/edit")
  end
end
