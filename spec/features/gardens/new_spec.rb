require "rails_helper"

describe 'gardens new page', type: :feature do
  describe 'they click from the navbar' do
    describe 'they fill in all the info' do
      it 'creates a new garden' do
        visit "/"
        click_link "Create Garden"

        expect(current_path).to eq("/gardens/new")

        fill_in "name", with: "The Garden"
        fill_in "max_plant_capacity", with: "20"
        check "watered"
        click_on "Save"

        expect(current_path).to eq("/gardens")
        expect(page).to have_link("The Garden")
      end
    end
  end
end