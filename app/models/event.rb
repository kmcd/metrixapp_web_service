class Event < ActiveRecord::Base
  validates_presence_of :name, :account_code
  
  named_scope :grouped_by_date_name, lambda {|account_code|
    { :conditions => { :account_code => account_code },
      :select => 'date(created_at), name, count(created_at)', 
      :group => 'date(created_at), name',
      :order => 'date(created_at)' }
  }
    
  def self.create_from_log(query_string)
    account_code = query_string[/account_code=([A-Za-z0-9]{32})/,1]
    name = query_string[/&name=(.*)&/,1]
    data = query_string[/&data=(.*)/,1]
    create :account_code => account_code, :name => name, :data => data
  end
end
