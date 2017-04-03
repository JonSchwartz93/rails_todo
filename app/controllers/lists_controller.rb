class ListsController < ApplicationController
	before_action :find_list, only: [:show, :edit, :update, :destroy] #,:completed_list?]

	def new
		@list = List.new
	end

	def create
		@list = current_user.lists.new(list_params)
		if @list.save
			redirect_to [current_user, @list]
		else
			@errors = @list.errors.full_messages
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @list.update(list_params)
			redirect_to [current_user, @list]
		else
			render 'edit'
		end
	end

	def destroy
		@list.destroy
		redirect_to current_user
	end

	private

	def find_list
		@list = List.find(params[:id])
	end

	def list_params
		params.require(:list).permit(:title, :description, :user_id)
	end

end
