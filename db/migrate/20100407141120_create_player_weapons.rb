class CreatePlayerWeapons < ActiveRecord::Migration
  def self.up
    create_table :player_weapons do |t|
      t.integer :level
      t.integer :attack_score
      t.integer :defense_score

      t.timestamps
    end
  end

  def self.down
    drop_table :player_weapons
  end
end
