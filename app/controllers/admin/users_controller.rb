class Admin::UsersController < ApplicationController
  before_action :authenticate_user! 
  before_action :is_admin?
  layout 'admin'

  def index
     @users = User.all
  end
  
  def new
   @user = User.new
   @url = admin_users_path  	
  end

  def create
  	@user = User.new(users_params)
  	if @user.save(users_params)
  	  redirect_to admin_users_path
  	else
  	  redirect_to :back	
  	end 	
  end
  
  def edit
  	@user = User.find(params[:id])
  	@url = admin_user_path
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(users_params)
  	  redirect_to admin_users_path
  	else
  	  redirect_to :back	
  	end 	
  end  
  
  def change_password
    @user = User.find(params[:user_id])
    @url = admin_user_update_password_path(@user)
  end

  def update_password
     @user = User.find(params[:user_id])
     if @user.update(users_params)
        redirect_to admin_users_path
     else
        redirect_to :back
     end
  end

 private
	
  def users_params
     params.require(:user).permit(:first_name, :last_name, :email, :is_admin, :password)	  	
	end

  def is_admin?
    redirect_to root_path unless current_user.is_admin?   
  end


end


