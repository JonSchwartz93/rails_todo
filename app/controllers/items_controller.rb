class ItemsController < ApplicationController
	before_action :find_list, only: [:new, :create]

	def new
		@item = Item.new
	end

	def create
		@item = @list.items.new(item_params)
		# @item = current_user.lists.items.new(item_params)
		if @item.save
			redirect_to [@list]
		else
			@errors = @item.errors.full_messages
			render 'new'
		end
	end

private

	def find_list
		@list = List.find(params[:list_id])
	end

	def item_params
		params.require(:item).permit(:content, :list_id)
	end

end

