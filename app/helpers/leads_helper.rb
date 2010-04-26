module LeadsHelper
  def error_css_for(lead)
    lead.errors.on(:email_address) ? 'error' : ''
  end
  
  def error_message_for(lead)
    content_tag(:p, lead.errors.on(:email_address)) if lead.errors.on(:email_address)
  end
end
