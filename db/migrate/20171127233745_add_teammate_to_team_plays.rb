class AddTeammateToTeamPlays < ActiveRecord::Migration[5.1]
  def change
    add_column :team_plays, :teammate_id, :integer
  end
end
