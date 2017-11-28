class LineResult < ApplicationRecord
  belongs_to :game_item
  belongs_to :game 
  belongs_to :match 
  

end
