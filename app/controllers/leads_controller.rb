class LeadsController < ApplicationController
  def lander
    # Multi-variate test keyword combinations
  end
  
  def new
    @lead = Lead.new
  end
  
  def create
    @lead = Lead.new params[:lead]
    render :action => 'new' unless @lead.save
  end
end
