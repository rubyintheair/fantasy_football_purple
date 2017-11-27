class GameItem < ApplicationRecord
  validates :name, :question, presence: true, uniqueness: true
end
