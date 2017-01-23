class CategoriesController < ApplicationController

before_action :authenticate_user! 
before_action :is_admin?

layout 'admin'

def index
    @categories = Category.all
end

def new
    @category = Category.new
    @url = categories_path
end

def create
    @category = Category.new(category_params)
    if @category.save
       redirect_to categories_path
    else
       render 'new'
    end
end

def edit
    @category = Category.find(params[:id])
    @url = category_path(@category) 
end

def update
	@category = Category.find(params[:id])
	if @category.update(category_params)
       redirect_to categories_path
    else
       render 'edit'
    end
end

def show
  @category = Category.find(params[:id])
  @products = @category.products
end

def destroy
	@category = Category.find(params[:id])
	@category.destroy
	redirect_to categories_path
end

 private
	def category_params
		params.require(:category).permit(:name, :description)
	end

  def is_admin?
    redirect_to root_path unless current_user.is_admin?   
  end

end




