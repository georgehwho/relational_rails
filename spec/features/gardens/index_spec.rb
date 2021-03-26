require 'rails_helper'

RSpec.describe "gardens index page", type: :feature do
  it "can see all gardens and their creation date" do
    garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
    plant_1 = Plant.create!(name:        "Blue Rose",
                            age: 5,
                            in_season:     true,
                            garden_id: garden.id)
    plant_2 = Plant.create!(name:        "Yellow Flower",
                            age: 10,
                            in_season:     false,
                            garden_id: garden.id)
    visit "/gardens"

    expect(page).to have_content(garden.name)
    expect(page).to have_content("These are the Gardens")
    # expect(page).to have_content("created #{time_ago_in_words(garden.created_at)} ago")
  end

  it "can see all gardens and their creation date" do
    garden = Garden.create!(name: "Front Lawn", watered: true, max_plant_capacity: 25)
    plant_1 = Plant.create!(name:        "Red Rose",
                            age: 5,
                            in_season:     true,
                            garden_id: garden.id)
    plant_2 = Plant.create!(name:        "Benca",
                            age: 10,
                            in_season:     false,
                            garden_id: garden.id)
    visit "/gardens"

  #   expect(current_path).to eq('/gardens')
  #   expect(page).to have_link("#{garden.name}")
  #   click_link "#{garden.name}"
  #   expect(current_path).to eq("/gardens/#{garden.id}")
  end
end
