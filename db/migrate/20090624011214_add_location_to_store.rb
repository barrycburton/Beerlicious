class AddLocationToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :lat, :decimal, :precision => 15, :scale => 10
    add_column :stores, :lng, :decimal, :precision => 15, :scale => 10
  end

  def self.down
    remove_column :stores, :lng
    remove_column :stores, :lat
  end
end
