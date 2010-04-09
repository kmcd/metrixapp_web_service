class Chart
  def initialize(events)
    @events = events
  end
  
  def data
    xml = Builder::XmlMarkup.new
    xml.chart do
      xml.series do
        x_axis_time_series(xml)
      end
      xml.graphs do
        plot_lines(xml)
      end
    end.gsub(/\"/,'\'') # FIXME: set single quotes in builder
  end
  
  def settings
    xml = Builder::XmlMarkup.new
    xml.settings do
    end
  end
  
  private
  
  def x_axis_time_series(xml)
    @events.group_by(&:date).keys.each_with_index do |date,index|
      xml.value date, :xid => index + 1
    end
  end
  
  def plot_lines(xml)
    @events.group_by(&:name).each_with_index do |eg,index|
      xml.graph(:gid => index + 1) do
        eg.last.each_with_index do |e, index|
          xml.value e.count, :xid => index + 1
        end
      end
    end
  end
end
