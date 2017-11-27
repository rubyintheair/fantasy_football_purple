class Team < ApplicationRecord
  has_many :users, through: :teamplays
  
end
