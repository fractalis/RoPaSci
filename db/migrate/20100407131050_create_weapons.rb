class CreateWeapons < ActiveRecord::Migration
  def self.up
    create_table :weapons do |t|
      t.string :name
      t.string :image
      t.integer :base_attack
      t.integer :base_defense
      t.integer :mod_attack
      t.integer :mod_defense
      t.timestamps
    end
  end

  def self.down
    drop_table :weapons
  end
end
