require 'rails_helper'

describe VideoGame, type: :model do
  describe 'relationships' do
    it { should belong_to :game_company }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:max_players) }
  end
end
