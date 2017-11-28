class Team < ApplicationRecord
  belongs_to :team_display, polymorphic: true
  belongs_to :user
end
