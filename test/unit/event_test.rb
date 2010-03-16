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
