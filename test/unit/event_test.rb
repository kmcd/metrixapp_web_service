require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = Event.new
  end
  
  test "should have a name" do
    assert !@event.valid?
    assert_not_nil @event.errors.on(:name)
  end
  
  test "should have an account code" do
    assert !@event.valid?
    assert_not_nil @event.errors.on(:account_code)
  end
  
  test "should save data as text" do
    test_data = "a"*9999
    @event.update_attribute :data, test_data
    assert_equal test_data, @event.reload.data
  end
end

class EventGraphFinderTest < ActiveSupport::TestCase
  test "should find by account code" do
    account_code, name = 'abc', 'signup'
    assert_equal [], Event.grouped_by_date_name(account_code)
    
    Event.create :account_code => account_code, :name => name
    events = Event.grouped_by_date_name(account_code)
    assert_equal 1, events.size
    assert_equal name, events.first.name
  end
  
  # TODO: test boundary conditions, eg midnight, year start/end
end

class EventCreateFromLogTest < ActiveSupport::TestCase
  test "should create an event from a log request" do
    account_code = "57577942568b4bbdbc578bbec30e0bfd"
    name = "Signup"
    data = "undefined"
    event = Event.create_from_log "account_code=#{account_code}&name=#{name}&data=#{data}"
    
    assert_equal account_code, event.account_code
    assert_equal name, event.name
    assert_equal data, event.data
  end
end
