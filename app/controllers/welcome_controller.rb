class WelcomeController < ApplicationController

include WelcomeHelper

layout 'login'

  def index
    @categories = Category.all
  end
  
  def confirm_email
  	@user = User.find_by(:confirm_token => params[:token])
    unless @user.blank?
      @user.email_confirmed = true
      @user.confirm_token = nil
      @user.save
      redirect_to welcome_index_path     
    end
  end

end
