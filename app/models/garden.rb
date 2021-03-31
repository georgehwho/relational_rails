class Garden < ApplicationRecord
  validates_presence_of :name, :max_plant_capacity

  has_many :plants, :dependent => :destroy

  def self.sort_by_creation_time
    order(created_at: :desc)
  end
end
