require 'rails_helper'

RSpec.describe "game_companies video_games page", type: :feature do
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
    expect(page).to have_content(video_game_1.max_players)
    expect(page).to have_content(video_game_1.is_live)
    expect(page).to have_content(video_game_1.id)
    expect(page).to have_content(game_company.id)

    first(:link, 'Details').click

    expect(page).to have_content(video_game_2.name)
    expect(page).to have_content(video_game_2.max_players)
    expect(page).to have_content(video_game_2.is_live)
    expect(page).to have_content(video_game_2.id)
    expect(page).to have_content(game_company.id)

    expect(page).not_to have_content(video_game_3.name)
  end
end
