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
    visit "/video_games"

    expect(page).to have_content(video_game_1.name)
    expect(page).to have_content(video_game_2.name)
    expect(page).to have_content("All Video Games")
    first(:link, 'Details').click
    expect(page).to have_content(video_game_1.max_players)
    expect(page).to have_content(video_game_1.is_live)
    expect(page).to have_content(video_game_2.max_players)
    expect(page).to have_content(video_game_2.is_live)
  end
end
