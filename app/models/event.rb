class Event < ActiveRecord::Base
  validates_presence_of :name, :account_code
  
  named_scope :graph_data_for, lambda {|account_code|
    { :conditions => { :account_code => account_code },
      :select => 'date(created_at), name, count(created_at)',
      :group => 'date(created_at), name',
      :order => 'date(created_at), name' }
  }
    
  def self.create_from_log(params)
    create :account_code => params['account_code'], :name =>params['name'], 
      :data => params['data']
  end
  
  def self.csv_for(account_code)
    find(:all, :conditions => { :account_code => account_code } ).
      to_csv(:only => [:created_at, :name, :data])
  end
end
