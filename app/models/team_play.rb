class TeamPlay < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :teammate, class_name: "User" 
  has_many :teams, as: :team_display


  # has_many :owner_teams, foreign_key: "owner_team_id"    Useless code???
  # has_many :guest_teams, foreign_key: "guest_team_id"
end
