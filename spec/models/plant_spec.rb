require "rails_helper"

describe Plant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end
  describe 'associations' do
    it { should belong_to(:garden) }
  end
end