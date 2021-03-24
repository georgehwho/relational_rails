class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.boolean :in_season
      t.integer :age

      t.timestamps
    end
  end
end
