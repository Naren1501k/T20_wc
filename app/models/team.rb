class Team < ApplicationRecord
  has_many :player
  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  validates :player_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
