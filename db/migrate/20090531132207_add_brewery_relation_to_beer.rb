class AddBreweryRelationToBeer < ActiveRecord::Migration
  def self.up
    
    change_table :beers do |t|
      t.rename :brewery, :brewery_name
      t.belongs_to :brewery
      t.remove :stores
      t.remove :price
      t.remove :size
    end
    
    change_table :breweries do |t|
      t.remove :beers_id
    end
    
    beers = Beer.all
    beers.each do |beer|
      brewery = Brewery.new(:name => beer.brewery_name )
      brewery.save
      beer.brewery = brewery
      beer.save
    end
    
    change_table :beers do |t|
       t.remove :brewery_name
    end
    
  end

  def self.down
    change_table :beers do |t|
      t.decimal :size
      t.decimal :price
      t.string :stores
      t.remove :brewery_id
      t.rename :brewery_name, :brewery
    end
    
    change_table :breweries do |t|
      t.integer :beers_id
    end
    
  end
end
