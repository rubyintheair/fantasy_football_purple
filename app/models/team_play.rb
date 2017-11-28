class TeamPlay < ApplicationRecord
  belongs_to :user
  belongs_to :teammate, class_name: "User" 
  has_many :teams, as: :team_display, dependent: :destroy
end
