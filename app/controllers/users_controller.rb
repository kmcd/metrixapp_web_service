class UsersController < ApplicationController
  layout 'landing_page'
  
  def new  
    @user = User.new
  end  
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      UserSession.create @user, true
      session[:signup] = true
      redirect_to new_report_path
    else  
      render :action => 'new'
    end
  end
end
