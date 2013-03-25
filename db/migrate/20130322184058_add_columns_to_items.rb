class AddColumnsToItems < ActiveRecord::Migration
  def change
	add_column("items", "short_description", :text)
	add_column("items", "image_url", :string, :limit => 255)
	add_column("items", "main_url", :string, :limit => 255)
  end
end
