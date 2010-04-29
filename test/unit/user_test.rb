require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "sets up account on signup" do
    @user = User.new
    @user.save false
    
    assert_kind_of Account, @user.account
  end
end
