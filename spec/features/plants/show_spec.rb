require 'rails_helper'

RSpec.describe "plants show page", type: :feature do
  it "can see selected plant by id's attributes" do
    garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
    plant_1 = Plant.create!(name:        "Blue Rose",
                            age: 3,
                            in_season:     true,
                            garden_id: garden.id)
    plant_2 = Plant.create!(name:        "Black Rose",
                            age: 4,
                            in_season:     false,
                            garden_id: garden.id)
    visit "/plants/#{plant_1.id}"

    expect(page).to have_content(plant_1.name)
    expect(page).to have_content(plant_1.age)
    expect(page).to have_content(plant_1.in_season)
    expect(page).to have_content(plant_1.garden_id)

    visit "/plants/#{plant_2.id}"

    expect(page).to have_content(plant_2.name)
    expect(page).to have_content(plant_2.age)
    expect(page).to have_content(plant_2.in_season)
    expect(page).to have_content(plant_2.garden_id)
  end

  it "can see selected plant by id's attributes" do
    garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
    plant_1 = Plant.create!(name:        "Blue Rose",
                            age: 3,
                            in_season:     true,
                            garden_id: garden.id)
    plant_2 = Plant.create!(name:        "Black Rose",
                            age: 4,
                            in_season:     false,
                            garden_id: garden.id)
    visit "/plants/#{plant_1.id}"

    expect(current_path).to eq("/plants/#{plant_1.id}")
    expect(page).to have_link("Delete")
    click_link "Delete"
    expect(current_path).to eq("/plants")
  end
end
