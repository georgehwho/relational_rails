require 'rails_helper'

RSpec.describe "game_companies index page", type: :feature do
  it "can see all game companies and their creation date" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/game_companies"

    expect(page).to have_content(game_company.title)
    expect(page).to have_content("All Game Companies")
    expect(page).to have_content("created #{time_ago_in_words(game_company.created_at)} ago")
  end

  it "can redirect to a game company's attributes page" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/game_companies"

    expect(current_path).to eq('/game_companies')
    expect(page).to have_link("#{game_company.title}")
    click_link "#{game_company.title}"
    expect(current_path).to eq("/game_companies/#{game_company.id}")
  end
end
