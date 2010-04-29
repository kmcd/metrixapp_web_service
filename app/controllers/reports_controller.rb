class ReportsController < ApplicationController
  before_filter :require_user
  
  def new
  end
  
  def index
    @events = Event.grouped_by_date_name
    
    respond_to do |format|
      format.html do
        redirect_to new_report_path if current_user.blank_slate?
      end
      
      format.xml  # Load amstock_settings (maybe this should not be publicly available)
      format.csv  # Render entire dataset as CSV
    end
  end
end
