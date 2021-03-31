class Plant < ApplicationRecord
  validates_presence_of :name, :age

  belongs_to :garden

  def self.age_over(arg)
    where("age > ?", arg)
  end

  def self.alphabetize
    order('lower(name)')
  end
end
