class VideoGame < ApplicationRecord
  belongs_to :game_company
  validates_presence_of :name, :is_live, :max_players
end
