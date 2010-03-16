class ReportsController < ApplicationController
  def index
    @events = Event.find(:all, :conditions => {:created_at => (6.days.ago..0.days.ago) } )
  end
end
