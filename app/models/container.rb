class Container < ActiveRecord::Base
  belongs_to :beer
  belongs_to :store
  
  validates_presence_of :volume, :count, :price, :beer_id, :store_id
  
end
