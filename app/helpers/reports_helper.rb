module ReportsHelper
  def format_date(days_ago)
    days_ago.to_date.to_s(:db)
  end
end
