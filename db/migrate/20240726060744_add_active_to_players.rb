class AddActiveToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :active, :boolean
  end
end
