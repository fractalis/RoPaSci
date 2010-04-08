class ChangePersistanceToPersistenceInUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :persistance_token
    add_column :users, :persistence_token, :string
  end

  def self.down
    remove_column :users, :persistence_token
    add_column :users, :persistance_token, :string
  end
end
