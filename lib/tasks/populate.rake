namespace :db do
  desc 'Create 1/2/4 weeks worth of sample data'
  task :populate => :environment do
    Event.destroy_all
    
    # This week
    (0..6).each do |days_previous|
      create_event(100, 'Acquisition', days_previous)
      create_event(18, 'Activation', days_previous)
      create_event(1, 'Retention', days_previous)
      create_event(6, 'Referral', days_previous)
      create_event(8, 'Renewal', days_previous)
    end
    
    # Last week
    (14..7).each do |days_previous|
      create_event(218, 'Acquisition', days_previous)
      create_event(45, 'Activation', days_previous)
      create_event(11, 'Retention', days_previous)
      create_event(61, 'Referral', days_previous)
      create_event(81, 'Renewal', days_previous)
    end
    
    # 3 & 4 weeks ago
    (30..15).each do |days_previous|
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
    Event.create :name => name, :created_at => created_at.days.ago
  end
end