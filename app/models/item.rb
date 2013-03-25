class Item < ActiveRecord::Base
  attr_accessible :name, :source, :selected, :number_of_skips, :short_description, :image_url, :main_url
  belongs_to :list
  
  scope :get_selected, lambda{|id| where({ :selected => true, :list_id => "#{id}" }) }
  scope :get_working_set, lambda{|id| where({:selected => false, :list_id => "#{id}", :completed_on => nil})  }
  
  validates :name,
	:presence => true, :length => {:within => 3..30}
  validates :short_description,
	:length => {:maximum => 140}
	
	def self.select_the_next_one(list_id)
		not_selected_list = Item.get_working_set(list_id)
		if( not_selected_list.size > 0 )
			working = not_selected_list[rand(not_selected_list.size)]
			working.selected = true
			working.save
			return working
		else 
			return nil
		end
			
	end
  
end
