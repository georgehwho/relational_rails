require "rails_helper"

describe 'gardens update page', type: :feature do
  describe 'they click the garden index' do
    describe 'they click garden name' do
      describe 'they click on edit' do
        describe 'they fill in new info' do
          it 'updates the garden' do
            garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)

            visit "/gardens/#{garden.id}"

            expect(current_path).to eq("/gardens/#{garden.id}")

            click_link "Edit"

            expect(current_path).to eq("/gardens/#{garden.id}/edit")

            fill_in "name", with: "NEW GARDEN"
            click_on "Save "

            expect(current_path).to eq("/gardens/#{garden.id}")
          end
        end
      end
    end
  end
end