require 'rails_helper'

describe "gardens plants page", type: :feature do
  describe 'they click on the garden name' do
    describe 'they click on the children' do
      before(:each) do
        @garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
        @garden_2 = Garden.create!(name: "Back Alright", watered: true, max_plant_capacity: 25)
        @plant_1 = Plant.create!(name:      "Blue Rose",
                                age:       3,
                                in_season: true,
                                garden_id: @garden.id)
        @plant_2 = Plant.create!(name:      "Black Rose",
                                age:       4,
                                in_season: false,
                                garden_id: @garden.id)
        @plant_3 = Plant.create!(name:      "Bubba",
                                age:       4,
                                in_season: false,
                                garden_id: @garden_2.id)
        visit "/gardens/#{@garden.id}/plants"
      end
      it 'displays all of the plants in that plant collection' do
        expect(page).to have_content(@garden.plants.ids.sort == [@plant_1.id, @plant_2.id])
        expect(page).to have_link(@plant_1.name)
        expect(page).to have_content(@plant_1.age)
        expect(page).to have_content(@plant_1.in_season)
        expect(page).to have_content(@garden.id)

        expect(page).to have_link(@plant_2.name)
        expect(page).to have_content(@plant_2.age)
        expect(page).to have_content(@plant_2.in_season)

        expect(page).not_to have_link(@plant_3.name)
      end
      describe 'they click one of the plant names' do
        it 'brings them to the plant show page' do
          click_link @plant_1.name

          expect(current_path).to eq("/plants/#{@plant_1.id}")
        end
      end
      describe 'they click add plant' do
        it 'allows them to add a plant to the garden' do
          click_link "Add Plant"

          expect(current_path).to eq("/gardens/#{@garden.id}/plants/new")

          fill_in "name", with: "test plant"
          fill_in "age", with: "20"
          check "in_season"
          click_on "Save"

          expect(current_path).to eq("/gardens/#{@garden.id}/plants")
          expect(page).to have_link("test plant")
          expect(page).to have_content("20")
          expect(page).to have_content(@garden.id)
        end
      end
      describe 'they click Sort By Alphabet' do
        it 'sorts the names by alphabet' do
          click_link "Sort By Alphabet"

          expect(current_path).to eq("/gardens/#{@garden.id}/plants")
        end
      end
    end
  end
end
