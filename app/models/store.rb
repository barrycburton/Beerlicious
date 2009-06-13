class Store < ActiveRecord::Base
  has_many :containers
  has_many :beers, :through => :containers
  
  validates_presence_of :name, :address, :kind
  
end
