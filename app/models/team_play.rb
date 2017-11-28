class TeamPlay < ApplicationRecord
  belongs_to :user
  belongs_to :teammate, class_name: "User" 
#  belongs_to :team
end
