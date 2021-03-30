require 'rails_helper'

describe GameCompany, type: :model do
  describe 'relationships' do
    it { should have_many :video_games }
  end
end
