require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new
  end
  
  test "should have a name" do
    assert !@event.valid?
    assert_not_nil @event.errors.on(:name)
  end
  
  test "should save data as text" do
    test_data = "a"*9999
    @event.update_attribute :data, test_data
    
    assert_equal test_data, @event.reload.data
  end
end

class EventDateRangeFindTest < ActiveSupport::TestCase
  test "should find this month by default" do
    assert_equal 0, Event.count
    assert_equal [], Event.find_in_date_range
    
    event = Event.create :created_at => 1.day.ago
    assert_equal [event], Event.find_in_date_range
  end
  
  test "should group by date and name" do
  end
  
  # TODO: test boundary conditions, eg midnight, year start/end
end
