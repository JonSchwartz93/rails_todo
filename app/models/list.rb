class List < ActiveRecord::Base
	belongs_to :user
	has_many :items
	validates :title, presence: true
	validates :description, presence: true

	def completed_list?
		completed_items = []
		@list.items.each do |item|
			unless !item.completed?
				completed_items << item
			end
		end
		if completed_items.length > 1
			return true
		end
	end
end
