# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def contact_email
    mail_to 'keith@dancingtext.com'
  end
  
  def google_analytics
    render :partial => 'shared/google_analytics' if RAILS_ENV == 'production'
  end
end
