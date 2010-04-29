require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = Account.create
  end
  
  test "should auto-generate random 32 alpha-numberic code" do
    assert_match /([A-Z]|[a-z]|[0-9]|){32}/, @account.code
    
    # TODO: test that re-generated code is unique
  end
  
  test "should have a unique code" do
    bogus_account = Account.create
    bogus_account.code = @account.code
    
    assert_equal false, bogus_account.valid?
  end
end
