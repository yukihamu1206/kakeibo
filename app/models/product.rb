class Product < ApplicationRecord
	belongs_to :user
	belongs_to :category

	validates :day, presence: true
	validates :memo, length:{maximum: 100}
	# 半角数字
	validates :price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/ }

	def total_price
	Product.joins(:category).group("actresses.name").count
	end

end


