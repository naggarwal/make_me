class ListsController < ApplicationController
	def index
		list
		render('list')
	end
	
	def list
		@lists = List.all
	end
	
	def show
		@list = List.find(params[:id])
		puts @list
	end
	
	def new
		@list = List.new
	end
	
	def create
		@list = List.new(params[:list])
		if @list.save
			flash[:notice] = "Your list,#{@list.name}, was created successfully" 
			redirect_to(:action => 'list')
		else
			render('new')
		end
	end
	
	def edit
		@list = List.find(params[:id])
	end
	
	def update
		@list = List.find(params[:id])
		if @list.update_attributes(params[:list])
			flash[:notice] = "Your list,#{@list.name}, was updated" 
			redirect_to(:action => 'list')
		else
			render('edit')
		end
	end
	
	def destroy
        @list = List.find(params[:id])
		@list.destroy
		flash[:notice] = "Your list,#{@list.name}, is gone. Boom!" 
		redirect_to(:action => 'list')
	end
end
