class Team < ApplicationRecord
  has_many :players
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id'
  accepts_nested_attributes_for :players, allow_destroy: true

  scope :from_country, ->(country) { where(country: country) }
  scope :founded_after, ->(year) { where("founded_year >?", year) }


  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  validates :founded, presence: true, numericality: { greater_than: 1901 }
end
