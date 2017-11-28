class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  has_many :team_plays, dependent: :destroy 
  has_many :teammates, through: :team_plays 
  has_many :single_plays, dependent: :destroy

  def add_teammate(another_user)
    teammates << another_user
  end 
end
