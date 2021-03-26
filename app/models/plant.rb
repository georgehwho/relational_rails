class Plant < ApplicationRecord
  belongs_to :garden

  def sort_alphabet
    Plant.sort_by(&:name)
  end
end
