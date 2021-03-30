class Plant < ApplicationRecord
  validates_presence_of :name, :age

  belongs_to :garden
end
