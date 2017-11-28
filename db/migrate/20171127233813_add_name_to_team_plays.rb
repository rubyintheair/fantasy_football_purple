class AddNameToTeamPlays < ActiveRecord::Migration[5.1]
  def change
    add_column :team_plays, :name, :string
  end
end
