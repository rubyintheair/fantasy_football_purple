class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :owner_team_id
      t.integer :guest_team_id
      t.integer :game_item_id
      t.float :score

      t.timestamps
    end
  end
end
