class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :player_id
      t.string :college
      t.string :country
      t.string :yearsPro
      t.integer :team_id
      t.string :date_of_birth
      t.string :position
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
