# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def contact_email
    mail_to 'keith@dancingtext.com'
  end
end
