class ReportsController < ApplicationController
  def index
    # TODO: split into 2 queries: graph data & totals
    
    # We just need the number of events for each day - NOT the data!
    # Implement using a group by, possibly resulting in graph data:
    # [ 1999-12-31 => [ 'Event 1' => 4, 'Event 2' => 19 ], ...  ]
    # and total for date range:
    # [ 'Event 1' => 401, 'Event 2' => 199 ]
    
    @events = Event.find(:all, :conditions => {:created_at => (start_date..end_date) } )
  end
  
  private
  
  def start_date
    return 6.days.ago if params[:end].blank?
    Date.parse params[:start]
  end
  
  def end_date
    return 0.days.ago if params[:end].blank?
    Date.parse params[:end]
  end
end
