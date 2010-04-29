class UserSessionsController < ApplicationController
  def new  
    @user_session = UserSession.new  
  end  
  
  def create  
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save  
      flash[:notice] = "Successfully logged in."  
      redirect_to new_report_path
    else  
      render :action => 'new'  
    end
  end
end
