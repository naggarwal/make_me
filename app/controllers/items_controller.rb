class ItemsController < ApplicationController
	def index
		
		redirect_to(:controller => 'lists', :action =>'list')
	end
	
	def list
		@list = List.find(params[:id])
		@items = @list.items
	end
	
	def new
		@list = List.find(params[:id])
		@item = Item.new
	end
	
	def create
		@item = Item.new(params[:item])
		@item.source = "webApp"
		@list = List.find(params["listId"])
		
		if @list.items << @item
			flash[:notice] = "Your list,#{@item.name}, was created successfully" 
			redirect_to(:action => 'list', :id => @list.id)
		else
			render('new')
		end
	end
	
	def edit
	#id is the id of the item
		@item = Item.find(params[:id])
		@list = @item.list
	end
	
	def update
	#id is the id of the item
		@item = Item.find(params[:id])
		@list = @item.list
		if @item.update_attributes(params[:item])
			flash[:notice] = "Your item,#{@item.name}, was updated" 
			redirect_to(:action => 'list', :id => @list.id)
		else
			render('edit')
		end
	end
	
	def destroy
	#id is the id of the item
        item = Item.find(params[:id])
		item.destroy
		flash[:notice] = "Your item,#{item.name}, is gone. Boom!" 
		redirect_to(:action => 'list', :id => item.list.id)
	end
	
	def display
		list_id = params[:list_id]
		@list = List.find(list_id)
		puts "List id is : #{list_id}"
		selected_list = Item.get_selected(list_id).limit(1)
		puts "Selected List = #{selected_list}"
		if (selected_list.size == 0 )
			not_selected_list = Item.get_working_set(list_id)
			if( not_selected_list.size > 0 )
			  working = not_selected_list[rand(not_selected_list.size)]
			  working.selected = true
			  working.save
			  @selected = working
			else
				@selected = nil
				flash[:notice] = "There are no items to complete in this list"
			end
			
		else
			@selected = selected_list[0]
		end
	end

end
