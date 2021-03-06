require 'rails_helper'

RSpec.describe "plants index page", type: :feature do
  it "can see all plants and their creation date" do
    garden = Garden.create!(name: "Silly Garden", watered: true, max_plant_capacity: 25)
    plant_1 = Plant.create!(name:        "Red Rose",
                            age: 5,
                            in_season:     true,
                            garden_id: garden.id)
    plant_2 = Plant.create!(name:        "Benca",
                            age: 10,
                            in_season:     false,
                            garden_id: garden.id)
    visit "/plants"

    expect(page).to have_link(plant_1.name)
    expect(page).not_to have_content(plant_2.name)
    expect(page).to have_content(plant_1.age)
    expect(page).to have_content(plant_1.in_season)
    expect(page).to have_content(plant_1.id)
    expect(page).to have_content(garden.id)
  end
  it "can see all plants and their creation date" do
    garden = Garden.create!(name: "Silly Garden", watered: true, max_plant_capacity: 25)
    plant_1 = Plant.create!(name:        "Red Rose",
                            age: 5,
                            in_season:     true,
                            garden_id: garden.id)
    plant_2 = Plant.create!(name:        "Benca",
                            age: 10,
                            in_season:     false,
                            garden_id: garden.id)
    visit "/plants"

    expect(current_path).to eq('/plants')
    expect(page).to have_link("Delete")
    click_link "Delete"
    expect(current_path).to eq("/plants")
  end
end
