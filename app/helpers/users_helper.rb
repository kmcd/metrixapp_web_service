module UsersHelper
  def error_css_for(user, field)
    user.errors.on(field) ? 'error' : ''
  end
  
  def error_message_for(user, field)
    return unless user.errors.on field
    [ user.errors.on(field) ].flatten.join ' and '
  end
end
