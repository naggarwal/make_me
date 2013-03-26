class List < ActiveRecord::Base
  attr_accessible :name
  
  has_many :items
  belongs_to :user
  
  scope :get_users_list, lambda{|id| where({:user_id => "#{id}"})  }
  
  validates :name,
	:presence => true, :length => {:within => 3..30}
  
end
