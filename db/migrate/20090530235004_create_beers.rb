class CreateBeers < ActiveRecord::Migration
  def self.up
    create_table :beers do |t|
      t.string :name
      t.string :info_url
      t.decimal :price
      t.text :stores
      t.decimal :size
      t.decimal :abv
      t.string :brewery
      t.string :style

      t.timestamps
    end
  end

  def self.down
    drop_table :beers
  end
end
