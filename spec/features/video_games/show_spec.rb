require 'rails_helper'

RSpec.describe "video_games show page", type: :feature do
  it "can see selected video game by id's attributes" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/video_games/#{video_game_1.id}"

    expect(page).to have_content(video_game_1.name)
    expect(page).to have_content(video_game_1.max_players)
    expect(page).to have_content(video_game_1.is_live)
  end

  it "can see edit button and redirect to edit page" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/video_games/#{video_game_1.id}"

    expect(current_path).to eq("/video_games/#{video_game_1.id}")
    expect(page).to have_link("Edit")
    click_link "Edit"
    expect(current_path).to eq("/video_games/#{video_game_1.id}/edit")
  end
end
