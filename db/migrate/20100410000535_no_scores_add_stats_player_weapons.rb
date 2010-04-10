class NoScoresAddStatsPlayerWeapons < ActiveRecord::Migration
  def self.up
    remove_column :player_weapons, :attack_score
    remove_column :player_weapons, :defense_score
    add_column :player_weapons, :player_id, :integer
    add_column :player_weapons, :times_played, :integer, :default => 0
  end

  def self.down
    remove_column :player_weapons, :player_id
    remove_column :player_weapons, :times_played
    add_column :player_weapons, :attack_score, :integer, :default => 0
    add_column :player_weapons, :defense_score, :integer, :default => 0
  end
end
