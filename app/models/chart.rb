class Chart
  def initialize(events)
    @events = events
  end
  
  def settings
    xml = Builder::XmlMarkup.new
    xml.settings do
      xml.data_sets do
        # One for each event line (ie login, upgrade etc.)
        xml.data_set do
          # Name, title etc.
          
          # Plot line
          xml.data ''
        end
      end
    end
  end
  
  private
  
  def x_axis_time_series(xml)
    @events.group_by(&:date).keys.each_with_index do |date,index|
      xml.value date.to_date.strftime("%a %d %b"), :xid => index + 1
    end
  end
  
  def plot_lines(xml)
    @events.group_by(&:name).each_with_index do |eg,index|
      xml.graph(:gid => index + 1, :title => eg.first) do
        eg.last.each_with_index do |e, index|
          xml.value e.count, :xid => index + 1
        end
      end
    end
  end
end
