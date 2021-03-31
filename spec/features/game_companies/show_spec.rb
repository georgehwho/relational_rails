require 'rails_helper'

RSpec.describe "game_companies show page", type: :feature do
  it "can see selected game company by id's attributes" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/game_companies/#{game_company.id}"

    expect(page).to have_content(game_company.title)
    expect(page).to have_content("Profitable?: #{game_company.profitable}")
    expect(page).to have_content("Number of Employees: #{game_company.employees}")
    expect(page).to have_content("Games Under this Company: #{game_company.video_games.count}")
  end

  it "can redirect to children from selected game company" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/game_companies/#{game_company.id}"

    expect(current_path).to eq("/game_companies/#{game_company.id}")
    expect(page).to have_link("This Company's Video Games:")
    click_link "This Company's Video Games:"
    expect(current_path).to eq("/game_companies/#{game_company.id}/video_games")
  end

  it "can redirect to an update page for selected game company via edit button" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/game_companies/#{game_company.id}"

    expect(current_path).to eq("/game_companies/#{game_company.id}")
    expect(page).to have_link("Edit")
    click_link "Edit"
    expect(current_path).to eq("/game_companies/#{game_company.id}/edit")
  end

  it "can click delete button and redirect to game_company index" do
    game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
    video_game_1 = VideoGame.create!(name:        "GTA",
                                    max_players: 500000,
                                    is_live:     true,
                                    game_company_id: game_company.id)
    video_game_2 = VideoGame.create!(name:        "League of Legends",
                                    max_players: 2300000,
                                    is_live:     false,
                                    game_company_id: game_company.id)
    visit "/game_companies/#{game_company.id}"

    expect(current_path).to eq("/game_companies/#{game_company.id}")
    expect(page).to have_link("Delete")
    click_link "Delete"
    expect(current_path).to eq("/game_companies")
  end
end
