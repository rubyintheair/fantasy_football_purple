class AddTeamScoreToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :owner_score, :float
    add_column :games, :guest_score, :float
  end
end
