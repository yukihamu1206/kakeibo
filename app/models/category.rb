class Category < ApplicationRecord
	# categoryを削除してもproductsは削除されない
	has_many :products, foreign_key: "category_id", :dependent => :nullify

	validates :name, length: { maximum: 8 },presence: true

	def category_total
	category.products. * quantity
	end


end
