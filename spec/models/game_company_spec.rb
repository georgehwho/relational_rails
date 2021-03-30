require 'rails_helper'

describe GameCompany, type: :model do
  describe 'relationships' do
    it { should have_many :video_games }
  end
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:profitable) }
    it { should validate_presence_of(:employees) }
  end
end
