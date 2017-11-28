class Team < ApplicationRecord
  belongs_to :team_display, polymorphic: true
end
