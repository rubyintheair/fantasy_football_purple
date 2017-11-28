class GameItem < ApplicationRecord
  validates :name, :question, presence: true, uniqueness: true
  has_many :games, foreign_key: "game_item_id"
 # has_many :line_results, dependent: :destroy 
end
