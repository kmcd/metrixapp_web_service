class ReportsController < ApplicationController
  def index
    # TODO: split into 2 queries: graph data & totals
    
    # We just need the number of events for each day - NOT the data!
    # Implement using a group by, possibly resulting in graph data:
    # [ 1999-12-31 => [ 'Event 1' => 4, 'Event 2' => 19 ], ...  ]
    # and total for date range:
    # [ 'Event 1' => 401, 'Event 2' => 199 ]
    
    @events = Event.find_in_date_range params[:start], params[:end]
    @chart_data = ChartData.new @events
  end
end
