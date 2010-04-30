require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "sets up account on signup" do
    @user = User.new
    @user.save false
    
    assert_kind_of Account, @user.account
  end
  
  test "should know if the user has recently signed up" do
    assert_equal true, User.new.blank_slate?
    
    Event.create :account_code => user.account.code, :name => 'foo'
    assert_equal false, user.blank_slate?
  end
  
  def user
    @user ||= User.create :email => 'jane@example.org', :password => 'password', 
      :password_confirmation => 'password'
  end
end
