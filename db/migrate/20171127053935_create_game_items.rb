class CreateGameItems < ActiveRecord::Migration[5.1]
  def change
    create_table :game_items do |t|
      t.string :name
      t.text :guidance

      t.timestamps
    end
  end
end
