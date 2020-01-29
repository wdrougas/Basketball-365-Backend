class CreateTeamGames < ActiveRecord::Migration[6.0]
  def change
    create_table :team_games do |t|
      t.integer :team_id
      t.integer :game_id

      t.timestamps
    end
  end
end
