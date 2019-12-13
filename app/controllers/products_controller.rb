class ProductsController < ApplicationController

	before_action :authenticate_user!

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.user_id = current_user.id
		if @product.save
			redirect_to product_path(@product)
		else
			render :new
		end
	end


	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to product_path(@product)
		else
			render :edit
		end
	end

	def index
		@categories = Category.all
	    @total_budget = @categories.sum(:budget)
	    @products = Product.all
	    @total_price = @products.sum(:price)

		# each文で書く方法
	    # @total_price = 0
    	# @products.each do |product|
     	# @total_price += product.price
        # end
	end


	private

	def product_params
		params.require(:product).permit(:name,:day,:memo,:category_id,:price)
	end


end
