class Match < ApplicationRecord
  belongs_to :owner_team, class_name: "TeamPlay"
  belongs_to :guest_team, class_name: "TeamPlay"
  has_many :games, dependent: :destroy
#  has_many :line_results, dependent: :destroy

  
end
