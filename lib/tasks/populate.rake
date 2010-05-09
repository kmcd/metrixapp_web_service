namespace :db do
  desc 'Create 1/2/4 weeks worth of sample data'
  task :populate => :environment do
    
    # This week
    (0..6).each do |days_previous|
      create_event(100, 'Viewed landing page', days_previous)
      create_event(18, 'Signed up', days_previous)
      create_event(1, 'Logged in', days_previous)
      create_event(8, 'Upgrade to premium account', days_previous)
    end
    
    # Last week
    (7..14).each do |days_previous|
      create_event(218, 'Viewed landing page', days_previous)
      create_event(45, 'Signed up', days_previous)
      create_event(11, 'Logged in', days_previous)
      create_event(81, 'Upgrade to premium account', days_previous)
    end
    
    # 3 & 4 weeks ago
    (15..30).each do |days_previous|
      create_event(197, 'Viewed landing page', days_previous)
      create_event(34, 'Signed up', days_previous)
      create_event(16, 'Logged in', days_previous)
      create_event(6, 'Upgrade to premium account', days_previous)
    end
  end
end

def create_event(records, name, created_at)
  # TODO: randomise each day slightly, say +/- 10%
  records.times do
    Event.create! :name => name, :created_at => created_at.days.ago, 
      :account_code => account_code
  end
end

def account_code
  @account_code ||= user.account.code
end

def user
  @user ||= User.find_or_create_by_email :email => 'kmcd@example.org',
    :password => 'password', :password_confirmation => 'password'
end