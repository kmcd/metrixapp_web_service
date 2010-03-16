class ReportsController < ApplicationController
  def index
    @events = Event.find(:all, :conditions => {:created_at => date_range } )
  end
  
  private
  
  def date_range
    # TODO: change to db date format, eg 1999-12-31
    (start_date.days.ago..end_date.days.ago)
  end
  
  def start_date
    return 6 if params[:end].blank?
    params[:start].to_i
  end
  
  def end_date
    return 0 if params[:end].blank?
    params[:end].to_i
  end
end
