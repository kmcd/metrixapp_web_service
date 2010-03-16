class LeadsController < ApplicationController
  def new
  end
  
  def create
    @lead = Lead.new params[:lead]
    
    if !@lead.save
      # TODO: these messages belong in the view
      flash[:notice] = "Thanks for signing up. We'll send your login shortly."
    else
      flash[:error] = "Sorry, we couldn't create your trial account. Please contact keith@dancingtext.com and I'll set up your account manually"
    end
    redirect_to root_path
  end
end