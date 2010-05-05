# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class Log
  def self.call(env)
    if log_request?(env)
      Event.create_from_log Rack::Request.new(env).params
      [200, {"Content-Type" => "text/html"}, [""]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
  
  private
  
  def self.log_request?(env)
    env["PATH_INFO"] =~ /^\/log\?/
  end
end
