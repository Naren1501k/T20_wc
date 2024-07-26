class Match < ApplicationRecord
  belongs_to :Team
  has_many :players
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'


  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :for_team, ->(team) { where('home_team_id = ? OR away_team_id = ?', team.id, team.id) }
  scope :within_date_range, ->(start_date, end_date) { where(date: start_date..end_date) }

  before_save :check_date_not_in_past
  after_create :log_creation_message
  validate :date_must_be_in_future

  private

  def check_date_not_in_past
    if date.present? && date < Date.today
      errors.add(:date, "cannot be in the past")
      throw(:abort)
    end
  end

  def log_creation_message
    Rails.logger.info "Match created: #{self.inspect}"
  end

  validates :location, presence: true
  validates :date, presence: true, uniqueness: { scope: :location }
  validates :home_team, presence: true 
  validates :away_team, presence: true
  

  private

  def date_must_be_in_future
    return if date.blank?
    errors.add(:date, "must be in the future") if date < Date.today
  end

end
