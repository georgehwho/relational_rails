require "rails_helper"

describe 'plants new page', type: :feature do
  describe 'they click from the navbar' do
    describe 'they fill in all the info' do
      it 'creates a new plant' do
        garden = Garden.create!(name: "Front Lawn", watered: true, max_plant_capacity: 25)

        visit "/"
        click_link "Create Plant"

        expect(current_path).to eq("/plants/new")

        fill_in "name", with: "new plant"
        fill_in "age", with: "20"
        check "in_season"
        fill_in "garden_id", with: garden.id
        click_on "Save"

        expect(current_path).to eq("/plants")
        expect(page).to have_link("new plant")
        expect(page).to have_content("20")
      end
    end
  end
end