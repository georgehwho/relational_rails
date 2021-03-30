require 'rails_helper'

RSpec.describe "video_games new page", type: :feature do
  it "can display attributes" do
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
    visit "/game_companies/#{game_company.id}/video_games/new"

    expect(current_path).to eq("/game_companies/#{game_company.id}/video_games/new")
    expect(page).to have_content("Add Video Game to #{game_company.title}")
    fill_in('name', with: 'GTA')
    fill_in('max players', with: 50)
    check('boolean checkbox', allow_label_click: true)
  end

  it "can click submit button and redirect to game_copmany video_game index page" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/game_companies/#{game_company.id}/video_games/new"

    expect(current_path).to eq("/game_companies/#{game_company.id}/video_games/new")
    expect(page).to have_button("Create Video Game")
    click_button "Create Video Game"
    expect(current_path).to eq("/game_companies/#{game_company.id}/video_games")
  end
end
