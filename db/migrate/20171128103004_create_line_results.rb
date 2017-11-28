class CreateLineResults < ActiveRecord::Migration[5.1]
  def change
    create_table :line_results do |t|
      t.integer :game_item_id
      t.integer :game_id
      t.integer :match_id

      t.timestamps
    end
  end
end
