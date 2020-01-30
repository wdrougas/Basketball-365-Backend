class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :game_id
      t.string :visiting_team_name
      t.integer :visiting_team_id
      t.string :visiting_team_score
      t.string :home_team_name
      t.integer :home_team_id
      t.string :home_team_score
      t.string :arena
      t.string :city
      t.date :date

      t.timestamps
    end
  end
end
