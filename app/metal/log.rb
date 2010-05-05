# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class Log
  def self.call(env)
    if env["PATH_INFO"].match /^\/log$/
      Event.create_from_log Rack::Request.new(env).params
      [200, {"Content-Type" => "text/html"}, [""]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
