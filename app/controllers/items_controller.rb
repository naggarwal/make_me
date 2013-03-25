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

end
