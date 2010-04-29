class User < ActiveRecord::Base
  acts_as_authentic
  
  def blank_slate?
    true
  end
end
