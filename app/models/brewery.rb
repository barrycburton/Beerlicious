class Brewery < ActiveRecord::Base  
  has_many :beers
  
  validates_presence_of :name
  
end
