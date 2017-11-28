class SinglePlay < ApplicationRecord
  belongs_to :user
  has_many :teams, as: :team_display, dependent: :destroy, foreign_key: "team_id"
end
