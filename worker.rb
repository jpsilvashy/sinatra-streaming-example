require 'redis'

redis_url = ENV["REDISTOGO_URL"] || "redis://localhost:6379"
uri = URI.parse(redis_url)
r = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

while true do
  puts "publishing..."
  r.publish "time", Time.now.utc
  sleep 1  
end
