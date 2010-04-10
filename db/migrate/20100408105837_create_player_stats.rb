class CreatePlayerStats < ActiveRecord::Migration
  def self.up
    create_table :player_stats do |t|
      t.user_id :integer
      t.wins :integer
      t.losses :integer
      t.draws :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :player_stats
  end
end
