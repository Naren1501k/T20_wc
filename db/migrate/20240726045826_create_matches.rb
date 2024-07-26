class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.string :location
      t.date :date
      t.integer :home_team_id
      t.integer :away_team_id

      t.timestamps
    end
  end
end
