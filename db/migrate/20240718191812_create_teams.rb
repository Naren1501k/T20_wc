class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :country
      t.integer :founded
      t.integer :player_count
      t.text :description

      t.timestamps
    end
    add_index :teams, :name, unique: true
  end
end
