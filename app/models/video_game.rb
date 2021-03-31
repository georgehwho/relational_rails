class VideoGame < ApplicationRecord
  belongs_to :game_company
  validates_presence_of :name, :max_players

 scope :limit_max_players, -> (limit) {where("max_players >= #{limit}") }

end
