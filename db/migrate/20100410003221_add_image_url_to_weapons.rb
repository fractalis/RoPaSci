class AddImageUrlToWeapons < ActiveRecord::Migration
  def self.up
    add_column :weapons, :image_url, :string
  end

  def self.down
    drop_column :weapons, :image_url
  end
end
