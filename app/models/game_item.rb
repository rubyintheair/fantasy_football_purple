class GameItem < ApplicationRecord
  validates :name, :question, presence: true, uniqueness: true
  has_many :games, foreign_key: "game_item_id"
 # has_many :line_results, dependent: :destroy 
 ANSWERS = ["A. You are so beautiful",
  "B. That is reason why I love myself so much!",
  "C. You are so crazy and I love it",
  "D. This game is creative",
  "E. Ahihi! I know"
  ]
  enum answers: ANSWERS
  
end
