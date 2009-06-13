class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :containers
  has_many :stores, :through => :containers
  
  validates_presence_of :name
  
  accepts_nested_attributes_for :containers, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  def brewery_name
    return self.brewery.name
  end
  
  def container_volume
    return self.containers.map { |item| item.volume }.join(" ")
  end
  
  def container_price
    return self.containers.map { |item| item.price }.join(" ")
  end
  
  def store_name
    return self.stores.map { |item| item.name }.join(" ")
  end
  
  acts_as_ferret :fields => [:name, :brewery_name, :style, :abv, :container_volume, :container_price, :store_name]
      
end
