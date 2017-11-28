class AddTeamIdToSinglePlayNews < ActiveRecord::Migration[5.1]
  def change
    add_column :single_play_news, :team_id, :integer
  end
end
