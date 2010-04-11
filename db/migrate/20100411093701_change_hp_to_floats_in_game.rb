class ChangeHpToFloatsInGame < ActiveRecord::Migration
  def self.up
    change_column :games, :player1_hp, :float
    change_column :games, :player2_hp, :float
  end

  def self.down
  end
end
