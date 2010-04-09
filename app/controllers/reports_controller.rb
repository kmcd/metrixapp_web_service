class ReportsController < ApplicationController
  def index
    @events = Event.find_in_date_range params[:start], params[:end]
    @chart = Chart.new @events
  end
end
