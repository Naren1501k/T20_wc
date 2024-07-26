class Player < ApplicationRecord
  belongs_to :team 
  has_many :matches
  accepts_nested_attributes_for :matches, allow_destroy: true

  

  scope :active, -> { where(active: true) }
  scope :by_role, ->(role) { where(role: role) }

  default_scope { active }

  before_destroy :check_if_captain
  after_save :update_team_player_count
  before_create :validate_captain_count

  private

  def check_if_captain
    throw(:abort) if self.captain?
  end

  def update_team_player_count
    team.update(player_count: team.players.count)
  end

  def validate_captain_count
    if captain? && team.players.where(captain: true).count > 0
      errors.add(:base, "A team can only have one captain")
      throw(:abort)
    end
  end

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :position, presence: true
  validates :team_id, presence: true
  validates :role, presence: true, inclusion: { in: %w[allrounder bowler batsman] }

      
    
end
