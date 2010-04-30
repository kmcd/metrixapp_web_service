# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class Log
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/log/
      Event.create_from_log env["QUERY_STRING"]
      [200, {"Content-Type" => "text/html"}, [""]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
