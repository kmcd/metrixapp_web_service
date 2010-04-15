class ReportsController < ApplicationController
  def index
    @events = Event.grouped_by_date_name
    
    respond_to do |format|
      format.html # Show the grpah
      format.xml  # Load amstock_settings (maybe this should not be publicly available)
      format.csv  # Render entire dataset as CSV
    end
  end
end
