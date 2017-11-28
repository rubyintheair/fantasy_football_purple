class AddUserIdToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :user_id, :string
    add_column :teams, :integer, :string
  end
end
