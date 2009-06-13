class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :name
      t.string :info_url
      t.string :address
      t.string :geo_loc
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
