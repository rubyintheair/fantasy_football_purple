class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :team_plays, dependent: :destroy 
  has_many :teammates, through: :team_plays 
#  has_many :single_play_news, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_secure_password

  def add_teammate(another_user)
    teammates << another_user
  end 

  


end

