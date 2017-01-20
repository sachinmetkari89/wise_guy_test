class ProductsController < ApplicationController
  
  before_action :authenticate_user!
  layout 'admin'
  

  include ProductsHelper

    def index
        @products = Product.all	
    end

	def new
	    @product = Product.new
	    @url = products_path(@product)	
	end

	def create
		@product = Product.new(product_params)
		if @product.save
	       redirect_to products_path
	    else
	       redirect_to :back
	    end
	end

	def edit
        @product = Product.find(params[:id])
        @url = product_path(@product)
	end

	def update
	    @product = Product.find(params[:id])
		if @product.update(product_params)
	       redirect_to products_path
	    else
	       redirect_to :back
	    end	
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

  private
	def product_params
		params.require(:product).permit(:name, :price, :category_id)
	end

end
