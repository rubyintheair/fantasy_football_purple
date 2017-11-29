class Game < ApplicationRecord
  belongs_to :owner_team, class_name: "TeamPlay"
  belongs_to :guest_team, class_name: "TeamPlay"
  belongs_to :game_item
  belongs_to :match
  validate :check_team_member
 # has_one :line_result 

  def check_team_member
    if owner_team.user.id == guest_team.user.id || owner_team.user.id == guest_team.teammate.id || owner_team.teammate.id == guest_team.user.id || owner_team.teammate.id == guest_team.teammate.id
      errors.add(:game, "can not have the same member in 2 team")
    end 
  end 

  def winner
    owner_score > guest_score ? owner_team : guest_team 
  end 

  def loser 
    owner_score < guest_score ? guest_team : owner_team 
  end 
end
