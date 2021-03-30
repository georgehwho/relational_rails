require 'rails_helper'

RSpec.describe "video_games edit page", type: :feature do
  it "can see all forms and submit button" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/video_games/#{video_game_1.id}/edit"

    expect(page).to have_content("Edit: #{video_game_1.name}")
    fill_in('max_players', with: 1)
    fill_in('video_game_name', with: 'Halo')
    check('boolean checkbox', allow_label_click: true)
  end

  it "can click submit button and redirect to corresponding show page" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/video_games/#{video_game_1.id}/edit"

    expect(current_path).to eq("/video_games/#{video_game_1.id}/edit")
    expect(page).to have_button("Submit")
    click_button "Submit"
    expect(current_path).to eq("/video_games/#{video_game_1.id}")
  end
end
