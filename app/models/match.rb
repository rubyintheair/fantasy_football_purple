class Match < ApplicationRecord
  belongs_to :owner_team, class_name: "TeamPlay"
  belongs_to :guest_team, class_name: "TeamPlay"
  belongs_to :user
  has_many :games, dependent: :destroy
  validate :check_games
  # validate :check_team_member_match
  

  def check_games
    if games.size > 3
      errors.add(:match, "can not add more than 3 games in a match")
    end 
  end 

  # def check_team_member_match
  #   if owner_team.user.id == guest_team.user.id || owner_team.user.id == guest_team.teammate.id || owner_team.teammate.id == guest_team.user.id || owner_team.teammate.id == guest_team.teammate.id
  #     errors.add(:match, "can not have the same member in 2 team")
  #   end 
  # end 

  
#  has_many :line_results, dependent: :destroy

  
end
