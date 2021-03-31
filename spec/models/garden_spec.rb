require "rails_helper"

describe Garden, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:max_plant_capacity) }
  end

  describe 'relationships' do
    it { should have_many :plants }
  end

  describe 'class methods' do
    describe '::sort_by_created_time' do
      it 'returns the gardens orderd by creation time' do
        Garden.destroy_all
        @garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
        @garden_2 = Garden.create!(name: "Back Alright", watered: true, max_plant_capacity: 25)

        expect(Garden.sort_by_creation_time).to eq([@garden_2, @garden])
      end
    end
  end
end