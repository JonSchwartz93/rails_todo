class ItemsController < ApplicationController
	before_action :find_list, only: [:new, :create, :destroy, :complete]
	before_action :find_item, except: [:create]

	def new
		@item = Item.new
	end

	def create
		@item = @list.items.new(item_params)
		if @item.save
			redirect_to [@list]
		else
			@errors = @item.errors.full_messages
			redirect_to [@list]
		end
	end

	def destroy
		if @item.destroy
			flash[:success] = "List Item was deleted"
		else
			flash[:error] = "List Item could not be deleted."
		end
		redirect_to @list
	end

	def complete
		@item.update_attribute(:completed_at, Time.now)
		redirect_to @list, notice: "Item Completed"
	end

private

	def find_item
		@item = @list.items.find(params[:id])
	end

	def find_list
		@list = List.find(params[:list_id])
	end

	def item_params
		params.require(:item).permit(:content, :list_id)
	end

end

