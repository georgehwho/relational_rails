class CreateGameCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :game_companies do |t|
      t.string :title
      t.boolean :profitable
      t.integer :employees

      t.timestamps
    end
  end
end
