require 'redis'

uri = URI.parse(ENV["REDISTOGO_URL"])
r = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

while true do
  puts "publishing..."
  r.publish "time", Time.now.utc
  sleep 1  
end
