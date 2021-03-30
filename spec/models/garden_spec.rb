require "rails_helper"

describe Garden, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:watered) }
    it { should validate_presence_of(:max_plant_capacity) }
  end

  describe 'relationships' do
    it { should have_many :plants }
  end
end