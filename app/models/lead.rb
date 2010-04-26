class Lead < ActiveRecord::Base
  validates_format_of :email_address,
    :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
    :message => 'You must enter a valid email address, e.g. joe@example.org'
end
