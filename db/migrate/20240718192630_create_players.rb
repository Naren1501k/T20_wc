class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :position
      t.integer :team_id
      t.string :role
      t.boolean :is_captain
      t.boolean :is_active
      t.text :description

      t.timestamps
    end
  end
end
