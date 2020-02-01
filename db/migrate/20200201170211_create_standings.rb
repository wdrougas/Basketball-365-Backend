class CreateStandings < ActiveRecord::Migration[6.0]
  def change
    create_table :standings do |t|
      t.integer :win
      t.integer :loss
      t.string :team_name
      t.string :team_logo
      t.string :conference
      t.integer :team_id

      t.timestamps
    end
  end
end
