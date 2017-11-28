class AddOwnerTeamandGuestTeamToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :owner_team_id, :integer
    add_column :matches, :guest_team_id, :integer
  end
end
