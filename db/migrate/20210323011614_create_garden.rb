class CreateGarden < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.boolean :watered
      t.integer :max_plant_capacity
      t.string :name
    end
  end
end
