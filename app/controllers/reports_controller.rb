class ReportsController < ApplicationController
  before_filter :require_user
  
  def new
  end
  
  def index
    respond_to do |format|
      
      format.html do
        redirect_to new_report_path if current_user.blank_slate?
        setup_graph_data
      end
      
      # Load amstock_settings (maybe this should not be publicly available)
      format.xml { setup_graph_data } 
      
      format.csv { Event.all.to_csv(:only => [:created_at, :name, :data]) }
    end
  end
  
  private
  
  def setup_graph_data
    @events ||= Event.graph_data_for current_user.account_code
  end
end
