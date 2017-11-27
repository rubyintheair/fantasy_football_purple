class RemoveTeamplayidFromTeams < ActiveRecord::Migration[5.1]
  def change
    remove_column :teams, :teamplay_id, :integer
  end
end
