namespace :db do
  desc 'Create 1/2/4 weeks worth of sample data'
  task :populate => :environment do
    
    # This week
    (0..6).each do |days_previous|
      create_event(100, 'Acquisition', days_previous)
      create_event(18, 'Activation', days_previous)
      create_event(1, 'Retention', days_previous)
      create_event(6, 'Referral', days_previous)
      create_event(8, 'Renewal', days_previous)
    end
    
    # Last week
    (7..14).each do |days_previous|
      create_event(218, 'Acquisition', days_previous)
      create_event(45, 'Activation', days_previous)
      create_event(11, 'Retention', days_previous)
      create_event(61, 'Referral', days_previous)
      create_event(81, 'Renewal', days_previous)
    end
    
    # 3 & 4 weeks ago
    (15..30).each do |days_previous|
      create_event(197, 'Acquisition', days_previous)
      create_event(34, 'Activation', days_previous)
      create_event(16, 'Retention', days_previous)
      create_event(20, 'Referral', days_previous)
      create_event(6, 'Renewal', days_previous)
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
  @user ||= User.create :email => 'kmcd@example.org', :password => 'password',
    :password_confirmation => 'password'
end