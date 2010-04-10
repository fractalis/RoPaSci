class AddStatsToPlayerStats < ActiveRecord::Migration
  def self.up
    add_column :player_stats, :wins, :integer, :default => 0
    add_column :player_stats, :losses, :integer, :default => 0
    add_column :player_stats, :draws, :integer, :default => 0
  end

  def self.down
    drop_column :player_stats, :wins
    drop_column :player_stats, :losses
    drop_column :player_stats, :draws
  end
end
