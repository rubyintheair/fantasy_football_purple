class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  has_many :team_plays, dependent: :destroy 
  has_many :teams, through: :teamplays 
end
