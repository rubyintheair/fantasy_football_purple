class Match < ApplicationRecord
  belongs_to :owner_team, class_name: "TeamPlay"
  belongs_to :guest_team, class_name: "TeamPlay"
  belongs_to :user
  has_many :games, dependent: :destroy
  validate :check_games
  # validate :check_team_member_match
  
  def owner_score
    games.select {|game| game.owner_score}.reduce(0) {|sum, score| sum + score }
  end 

  def guest_score
    games.select {|game| game.guest_score}.reduce(0) {|sum, score| sum + score }
  end 

  def self.winner
    owner_score > guest_score ? owner_team : guest_team 
  end 

  def self.loser 
    owner_score < guest_score ? guest_team : owner_team 
  end 

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
