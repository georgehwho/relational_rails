require 'rails_helper'

RSpec.describe "gardens show page", type: :feature do
  it "can see selected garden by id's attributes" do
    garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
    plant_1 = Plant.create!(name:        "Blue Rose",
                            age: 3,
                            in_season:     true,
                            garden_id: garden.id)
    plant_2 = Plant.create!(name:        "Black Rose",
                            age: 4,
                            in_season:     false,
                            garden_id: garden.id)
    visit "/gardens/#{garden.id}"

    expect(page).to have_content(garden.name)
    expect(page).to have_content(garden.watered)
    expect(page).to have_content(garden.max_plant_capacity)
    expect(page).to have_content(garden.plants.count)
  end

  it "can redirect to children from selected garden company" do
    garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
    video_garden_1 = Plant.create!(name:        "Green Rose",
                                   age: 5,
                                   in_season:     false,
                                   garden_id: garden.id)
    video_garden_2 = Plant.create!(name:        "Yellow Rose",
                                   age: 7,
                                   in_season:     false,
                                   garden_id: garden.id)
    visit "/gardens/#{garden.id}"

    expect(current_path).to eq("/gardens/#{garden.id}")
    expect(page).to have_link("the children")
    click_link "the children"
    expect(current_path).to eq("/gardens/#{garden.id}/plants")
  end
end
