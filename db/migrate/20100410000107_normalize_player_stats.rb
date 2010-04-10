class NormalizePlayerStats < ActiveRecord::Migration
  def self.up
    add_column :players, :wins, :integer, :default => 0
    add_column :players, :losses, :integer, :default => 0
    add_column :players, :draws, :integer, :default => 0
    drop_table :player_stats
  end

  def self.down
  end
end
