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

    expect(page).to have_content("#{game_company.title} :")
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
    first(:link, "#{game_company.title}").click
    expect(current_path).to eq("/game_companies/#{game_company.id}")
  end

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

  it "has a button to click and redirect to a game_company creation page" do
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
    click_link "Game Companies"
    click_link "Create Game Company"
    expect(current_path).to eq('/game_companies/new')
  end

  it "can click a button for each company and redirect to a game_company's edit page" do
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
    first(:link, 'Edit').click
    expect(current_path).to eq("/game_companies/#{game_company.id}/edit")
  end

  it "can click delete and redirect to game_company index page" do
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
    first(:link, 'Delete').click
    expect(current_path).to eq("/game_companies")
  end
end
