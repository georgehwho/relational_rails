class GameCompany < ApplicationRecord
  has_many :video_games
  validates_presence_of :title, :employees
end
