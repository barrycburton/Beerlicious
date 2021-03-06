class Container < ActiveRecord::Base
  belongs_to :beer
  belongs_to :store
  
  validates_presence_of :volume, :count, :price, :store_id
  
end
