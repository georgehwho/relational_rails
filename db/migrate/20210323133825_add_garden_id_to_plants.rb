class AddGardenIdToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :garden_id, :integer
    add_foreign_key :plants, :gardens
  end
end
