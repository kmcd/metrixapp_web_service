class Event < ActiveRecord::Base
  validates_presence_of :name
  
  # TODO: maybe rename to a named scope
  def self.find_in_date_range(start_date=nil, end_date=nil)
    find :all, 
      :select => 'date(created_at), name, count(created_at)', 
      :conditions => {:created_at => date_range(start_date, end_date) },
      :group => 'date(created_at), name',
      :order => 'date(created_at)'
  end
  
  private
  
  def self.date_range(start_date, end_date)
    start_date  = parse_date(start_date)  || 30.days.ago.at_beginning_of_day
    end_date    = parse_date(end_date)    || 1.days.from_now.at_beginning_of_day - 1
    (start_date..end_date)
  end
  
  def self.parse_date(date)
    return unless date
    DateTime.parse date.to_s
  end
end
