class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
	  t.string "name"
	  t.boolean "visible", :default => false
	  t.timestamp "last_used"
	  
      t.timestamps
    end
	add_index("lists", "name")
  end
end
