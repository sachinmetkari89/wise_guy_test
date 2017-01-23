class User::DashboardController < ApplicationController
 before_action :authenticate_user!
 layout 'user'

  def index
	  @categories = Category.all
    @products = Product.search(params)
  end
  
end
