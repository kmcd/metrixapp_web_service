class ChartData
  def initialize(events)
    @events = events
    @xml = Builder::XmlMarkup.new
  end
  
  def to_xml
    @xml.chart do
      @xml.series do
        x_axis_time_series
      end
      @xml.graphs do
        plot_lines
      end
    end.gsub(/\"/,'\'') # FIXME: set single quotes in builder
  end
  
  private
  
  def x_axis_time_series
    @events.group_by(&:date).keys.each_with_index do |date,index|
      @xml.value date, :xid => index + 1
    end
  end
  
  def plot_lines
    @events.group_by(&:name).each_with_index do |eg,index|
      @xml.graph(:gid => index + 1) do
        eg.last.each_with_index do |e, index|
          @xml.value e.count, :xid => index + 1
        end
      end
    end
  end
end
