require "rails_helper"

describe Plant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end
  describe 'associations' do
    it { should belong_to(:garden) }
  end
  describe 'class methods' do
    describe '::age_over' do
      it 'returns the plants over the inputted age' do
        Plant.destroy_all
        @garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
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
                  garden_id: @garden.id)

        expect(Plant.age_over(3)).to eq([@plant_2, @plant_3])
      end
    end
    describe '::alphabetize' do
      it 'returns the plants order of names asec' do
        @garden = Garden.create!(name: "Backstreet", watered: true, max_plant_capacity: 25)
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
                  garden_id: @garden.id)

        expect(Plant.alphabetize).to eq([@plant_2, @plant_1, @plant_3])
      end
    end
  end
end