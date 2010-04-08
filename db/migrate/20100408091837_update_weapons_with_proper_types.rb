class UpdateWeaponsWithProperTypes < ActiveRecord::Migration
  def self.up
    change_column :weapons, :base_attack, :float
    change_column :weapons, :base_defense, :float
    change_column :weapons, :mod_attack, :float
    change_column :weapons, :mod_defense, :float
    add_column :weapons, :base_hp_regen, :float
    add_column :weapons, :mod_hp_regen, :float
  end

  def self.down
    remove_column :weapons, :base_hp_regen
    remove_column :weapons, :mod_hp_regen
    change_column :weapons, :base_attack, :int
    change_column :weapons, :base_defense, :int
    change_column :weapons, :mod_attack, :int
    change_column :weapons, :mod_defense, :int    
  end
end
