class WelcomeController < ApplicationController
  
layout 'login'

  def index
    @categories = Category.all
  end

end
