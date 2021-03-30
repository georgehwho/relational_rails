class Garden < ApplicationRecord
  validates_presence_of :name, :watered, :max_plant_capacity

  has_many :plants, :dependent => :destroy
end
