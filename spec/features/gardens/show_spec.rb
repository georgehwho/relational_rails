require 'rails_helper'

describe "gardens show page", type: :feature do
  describe 'they visit /gardens/:id' do
    it 'shows the garden attributes' do
      garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
      plant_1 = Plant.create!(name: "Blue Rose",
                              age: 3,
                              in_season: true,
                              garden_id: garden.id)
      plant_2 = Plant.create!(name: "Black Rose",
                              age: 4,
                              in_season: false,
                              garden_id: garden.id)

      visit "/gardens/#{garden.id}"

      expect(page).to have_content(garden.name)
      expect(page).to have_content(garden.watered)
      expect(page).to have_content(garden.max_plant_capacity)
      expect(page).to have_content(garden.plants.count)
    end
  end

  describe 'they click Edit' do
    it 'shows the edit page' do
      garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)

      visit "/gardens/#{garden.id}"

      click_link "Edit"

      expect(current_path).to eq("/gardens/#{garden.id}/edit")
    end
  end

  describe 'they click The Children' do
    it 'shows the /gardens/:id/plants page' do
      garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)

      visit "/gardens/#{garden.id}"

      click_link "The Children"

      expect(current_path).to eq("/gardens/#{garden.id}/plants")
    end
  end

  describe 'they click delete' do
    it 'redirects to plants index' do
      garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)

      visit "/gardens/#{garden.id}"
      expect(current_path).to eq("/gardens/#{garden.id}")
      expect(page).to have_link("Delete")
      click_link "Delete"
      expect(current_path).to eq("/gardens")
    end
  end
end
