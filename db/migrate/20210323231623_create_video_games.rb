class CreateVideoGames < ActiveRecord::Migration[5.2]
  def change
    create_table :video_games do |t|
      t.string :name
      t.integer :max_players
      t.boolean :is_live

      t.timestamps
    end
  end
end
