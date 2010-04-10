class AddWeaponIdToPlayerWeapons < ActiveRecord::Migration
  def self.up
    add_column :player_weapons, :weapon_id, :integer    
  end

  def self.down
    drop_column :player_weapons, :weapon_id
  end
end
