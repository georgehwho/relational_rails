class AddGameCompanyIdToVideoGame < ActiveRecord::Migration[5.2]
  def change
    add_column :video_games, :game_company_id, :integer
  end
end
