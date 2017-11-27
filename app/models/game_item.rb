class GameItem < ApplicationRecord
  validates :name, :question, presence: true
end
