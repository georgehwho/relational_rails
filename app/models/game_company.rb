class GameCompany < ApplicationRecord
  has_many :video_games, -> { order(created_at: :desc) }
end
