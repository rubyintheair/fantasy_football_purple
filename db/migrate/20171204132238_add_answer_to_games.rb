class AddAnswerToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :answer, :string
  end
end
