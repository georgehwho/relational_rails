require 'rails_helper'

RSpec.describe "game_companies new page", type: :feature do
  it "can reach a game_company creation page and see required fields" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/game_companies/new"

    expect(page).to have_content("Create New Game Company:")
    fill_in('number of employees', with: 1)
    fill_in('company name', with: 'Bungie')
    check('boolean checkbox', allow_label_click: true)
  end

  it "can click submit button and redirect to index page" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/game_companies/new"

    expect(current_path).to eq('/game_companies/new')
    expect(page).to have_button("Submit")
    click_button "Submit"
    expect(current_path).to eq('/game_companies')
  end
end
