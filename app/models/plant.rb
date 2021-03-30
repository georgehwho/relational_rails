class Plant < ApplicationRecord
  validates_presence_of :name, :age, :in_season

  belongs_to :garden
end
