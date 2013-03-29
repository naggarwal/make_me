class Item < ActiveRecord::Base
  attr_accessible :image_url,
    :main_url,
    :name,
    :number_of_skips,
    :selected,
    :short_description,
    :source

  belongs_to :list

  validates :name, presence: true
  validates :name, length: { within: 3..30 }
  validates :short_description, length: { maximum: 140 }

  scope :get_selected, lambda{|id| where({ :selected => true, :list_id => "#{id}" }) }

  scope :get_working_set, lambda{|id| where(["selected = false AND list_id = ? AND completed_on IS NULL and number_of_skips <= ?", id, 3])  }

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
