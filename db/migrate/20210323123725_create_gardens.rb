class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name
      t.boolean :watered
      t.integer :max_plant_capacity

      t.timestamps
    end
  end
end
