require 'rails_helper'

describe VideoGame, type: :model do
  describe 'relationships' do
    it { should belong_to :game_company }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:max_players) }
  end
  describe 'class methods' do
    it "limits max players" do
      game_company = GameCompany.create!(title: "Bethesda", profitable: true, employees: 60000)
      video_game_1 = VideoGame.create!(name:        "GTA",
                                      max_players: 50,
                                      is_live:     true,
                                      game_company_id: game_company.id)
      video_game_2 = VideoGame.create!(name:        "League of Legends",
                                      max_players: 2500,
                                      is_live:     false,
                                      game_company_id: game_company.id)
      expect(VideoGame.limit_max_players(51)).to include(video_game_2)
      expect(VideoGame.limit_max_players(51)).to_not include(video_game_1)
    end
  end
end
