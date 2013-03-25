class Item < ActiveRecord::Base
  attr_accessible :name, :source, :selected, :number_of_skips, :short_description, :image_url, :main_url
  
  belongs_to :list
  
  validates :name,
	:presence => true, :length => {:within => 3..30}
  validates :short_description,
	:length => {:maximum => 140}
  
end
