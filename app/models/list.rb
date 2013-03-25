class List < ActiveRecord::Base
  attr_accessible :name
  
  has_many :items
  
  #validates_presence_of :name
  
  validates :name,
	:presence => true, :length => {:within => 3..10}
  
end
