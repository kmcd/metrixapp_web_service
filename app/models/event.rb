class Event < ActiveRecord::Base
  validates_presence_of :name
  
  def self.find_in_date_range(start_date, end_date)
    find :all, :conditions => {:created_at => date_range(start_date, end_date) }
  end
  
  private
  
  def self.date_range(start_date, end_date)
    start_date  = parse_date(start_date)  || 7.days.ago.at_beginning_of_day
    end_date    = parse_date(end_date)    || 1.days.from_now.at_beginning_of_day - 1
    (start_date..end_date)
  end
  
  def self.parse_date(date)
    return unless date
    DateTime.parse date.to_s
  end
end
