class Match < ApplicationRecord
  belongs_to :owner_team, class_name: "TeamPlay"
  belongs_to :guest_team, class_name: "TeamPlay"
  has_many :games, dependent: :destroy
  validate :check_games

  def check_games
    if games.size > 3
      errors.add("can not add more than 3 games in a match")
    end 
  end 

  
#  has_many :line_results, dependent: :destroy

  
end
