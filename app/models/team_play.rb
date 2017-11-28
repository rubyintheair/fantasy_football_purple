class TeamPlay < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :teammate, class_name: "User" 
  has_many :teams, as: :team_display
end
