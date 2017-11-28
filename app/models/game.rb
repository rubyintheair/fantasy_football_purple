class Game < ApplicationRecord
  belongs_to :owner_team, class_name: "TeamPlay"
  belongs_to :guest_team, class_name: "TeamPlay"
  belongs_to :game_item

  def winner
    owner_score > guest_score ? owner_team : guest_team 
  end 

  def loser 
    owner_score < guest_score ? guest_team : owner_team 
  end 
end
