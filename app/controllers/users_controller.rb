class UsersController < ApplicationController
  layout 'landing_page'
  
  def new  
    @user = User.new  
  end  
  
  def create  
    @user = User.new(params[:user])
    
    if @user.save
      login_with params[:user]
      redirect_to new_report_path
    else  
      render :action => 'new'
    end
  end
  
  private
  
  def login_with(user)
    UserSession.create :username => user[:username], :password => user[:password]
  end
end
