class VideoGame < ApplicationRecord
  belongs_to :game_company
  validates_presence_of :name, :max_players
end
