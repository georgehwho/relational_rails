require 'rails_helper'

describe VideoGame, type: :model do
  describe 'relationships' do
    it { should belong_to :game_company }
  end
end
