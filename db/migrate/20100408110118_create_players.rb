class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :player_name, :null => false
      t.integer :user_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
