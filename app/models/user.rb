class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  has_many :team_plays, dependent: :destroy 
  has_many :teammates, through: :teamplays 
  has_many :single_plays, dependent: :destroy 
end
