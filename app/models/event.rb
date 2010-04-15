class Event < ActiveRecord::Base
  validates_presence_of :name
  
  named_scope :grouped_by_date_name,
    :select => 'date(created_at), name, count(created_at)', 
    :group => 'date(created_at), name',
    :order => 'date(created_at)'
end
