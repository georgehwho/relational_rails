require 'rails_helper'

describe "gardens index page", type: :feature do
  describe 'they visit /gardens' do
    it "can see all gardens and their creation date" do
      garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)

      visit "/gardens"

      expect(page).to have_link(garden.name)
      expect(page).to have_content("These are the Gardens")
      expect(page).to have_content(garden.created_at)
    end
  end

  describe 'they can create a new garden from index' do
    it 'can navigate to /new' do
      visit "/gardens"

      expect(current_path).to eq("/gardens")

      click_link "Create Garden"

      expect(current_path).to eq("/gardens/new")
    end
  end

  describe 'they can click on the garden names' do
    it 'navigates to the garden show page' do
      garden = Garden.create!(name: "Front Lawn", watered: true, max_plant_capacity: 25)

      visit "/gardens"

      expect(current_path).to eq('/gardens')
      expect(page).to have_link("#{garden.name}")
      click_link "#{garden.name}"
      expect(current_path).to eq("/gardens/#{garden.id}")
    end
  end
end
