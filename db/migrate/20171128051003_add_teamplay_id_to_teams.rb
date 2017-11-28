class AddTeamplayIdToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :teamplay_id, :integer
  end
end
