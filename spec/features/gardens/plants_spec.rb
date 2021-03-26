require 'rails_helper'

RSpec.describe "gardens plants page", type: :feature do
  it "can see selected garden by id's plant collection" do
    garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
    garden_2 = Garden.create!(name: "Back Alright", watered: true, max_plant_capacity: 25)
    plant_1 = Plant.create!(name:      "Blue Rose",
                            age:       3,
                            in_season: true,
                            garden_id: garden.id)
    plant_2 = Plant.create!(name:      "Black Rose",
                            age:       4,
                            in_season: false,
                            garden_id: garden.id)
    plant_3 = Plant.create!(name:      "Bubba",
                            age:       4,
                            in_season: false,
                            garden_id: garden_2.id)
    visit "/gardens/#{garden.id}/plants"

    expect(page).to have_content(garden.plants.ids.sort == [plant_1.id, plant_2.id])
    expect(page).to have_content(plant_1.name)
    expect(page).to have_content(plant_1.age)
    expect(page).to have_content(plant_1.in_season)
    expect(page).to have_content(garden.id)

    expect(page).to have_content(plant_2.name)
    expect(page).to have_content(plant_2.age)
    expect(page).to have_content(plant_2.in_season)
    expect(page).to have_content(garden.id)

    expect(page).not_to have_content(plant_3.name)
  end
end
