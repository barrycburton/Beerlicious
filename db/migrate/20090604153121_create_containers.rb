class CreateContainers < ActiveRecord::Migration
  def self.up
    create_table :containers do |t|
      t.decimal :volume
      t.decimal :count
      t.decimal :price
      t.belongs_to :beer
      t.belongs_to :store

      t.timestamps
    end
  end

  def self.down
    drop_table :containers
  end
end
