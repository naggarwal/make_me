class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
	  t.string "name"
	  t.string "source"
	  t.boolean "selected", :default => false
	  t.timestamp "completed_on"
      t.integer "rating"
      t.integer "number_of_skips"
      t.references :list 	  
      t.timestamps
    end
  end
end
