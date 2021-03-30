require "rails_helper"

describe Plant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:in_season) }
  end
  describe 'associations' do
    it { should belong_to(:garden) }
  end
end