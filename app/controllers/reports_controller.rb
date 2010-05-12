class ReportsController < ApplicationController
  before_filter :require_user
  
  def new
  end
  
  def index
    # Users currently only have one account
    redirect_to report_path(current_user.account)
  end
  
  def show
    respond_to do |format|
      format.html do
        redirect_to new_report_path if current_user.blank_slate?
        setup_graph_data
      end
      
      # Load amstock_settings (maybe this shouldnt be publicly available)
      format.xml { setup_graph_data } 
      
      format.csv do
        send_data Event.csv_for(current_user.account_code),
          :type => 'text/csv; charset=iso-8859-1; header=present',
          :disposition => "attachment; filename=reports.csv"
      end
    end
  end
  
  private
  
  def setup_graph_data
    @events ||= Event.graph_data_for( Account.find(params[:id]).code )
  end
end
