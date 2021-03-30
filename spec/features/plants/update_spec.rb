require "rails_helper"

describe 'plants update page', type: :feature do
  describe 'they click the plant index' do
    describe 'the click on a plant name' do
      describe 'they click on edit' do
        describe 'they fill in new info' do
          it 'updates the plant' do
            garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
            plant = Plant.create!(name:        "Blue Rose",
              age: 3,
              in_season:     true,
              garden_id: garden.id)

            visit "/plants/#{plant.id}"

            expect(current_path).to eq("/plants/#{plant.id}")

            click_link "Edit"

            expect(current_path).to eq("/plants/#{plant.id}/edit")

            fill_in "name", with: "new plant"
            check "in_season"
            click_on "Save"

            expect(current_path).to eq("/plants/#{plant.id}")
            expect(page).to have_content("new plant")
          end
        end
      end
    end
  end
end