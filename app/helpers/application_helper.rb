# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def contact_email
    mail_to 'keith@dancingtext.com'
  end
  
  def google_analytics
    production_only { render :partial => 'shared/google_analytics' }
  end
  
  def metrixapp_snippet
    production_only { render :partial => 'shared/metrixapp_snippet' }
  end
  
  def metrixapp_log(message)
    production_only { javascript_tag "metrix.log('#{message}');", :defer => 'defer' }
  end
  
  private
  
  def production_only
    yield if RAILS_ENV == 'production'
  end
end
