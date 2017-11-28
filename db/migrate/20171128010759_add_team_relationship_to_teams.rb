class AddTeamRelationshipToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :team_display_id, :integer
  end
end
