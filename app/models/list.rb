class List < ActiveRecord::Base
  attr_accessible :name

  has_many :items
  #belongs_to :user

  validates :name, presence: true
  validates :name, length: { within: 3..30}
end
