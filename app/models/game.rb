class Game < ApplicationRecord
  belongs_to :owner_team, class_name: "TeamPlay"
  belongs_to :guest_team, class_name: "TeamPlay"
  belongs_to :game_item
end
