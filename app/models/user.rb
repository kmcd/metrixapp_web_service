class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :account
  before_create :create_signup_account
  
  def blank_slate?
    return true unless account
    not Event.exists? :account_code => account.code
    # OPTIMIZE: cache this as it's loaded on each graph request
  end
  
  protected
  
  def create_signup_account
    return unless signup?
    write_attribute :account_id, Account.create.id
  end
  
  def signup?
    self.account_id.nil?
  end
end
