class Player < ApplicationRecord
  belongs_to :team

      validates :name, presence: true
      validates :age, presence: true
      validates :position, presence: true
      validates :team_id, presence: true 
      validates :role, presence: true
      
      
    
end
