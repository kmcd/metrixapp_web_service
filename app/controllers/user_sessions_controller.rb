class UserSessionsController < ApplicationController
  layout 'landing_page'
  
  def new
    @user_session = UserSession.new
  end  
  
  def create  
    @user_session = UserSession.new(params[:user_session])
    
    if @user_session.save
      redirect_to new_report_path
    else
      flash[:error] = true
      render :action => 'new'  
    end
  end
end
