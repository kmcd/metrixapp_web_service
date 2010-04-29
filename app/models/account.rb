require 'active_support/secure_random'

class Account < ActiveRecord::Base
  validates_presence_of :code
  validates_uniqueness_of :code
  before_validation_on_create :generate_code
  
  protected
  
  def generate_code
    write_attribute :code, unique_code
  end
  
  def unique_code
    code = SecureRandom.hex
    Account.exists?(:code => code) ? unique_code : code
  end
end
