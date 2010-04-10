class UpdatePlayerStatsUserIdColumn < ActiveRecord::Migration
  def self.up
    remove_column :player_stats, :user_id
    add_column :player_stats, :player_id, :integer
  end

  def self.down
    remove_column :player_stats, :player_id
    add_column :player_stats, :user_id, :integer
  end
end
