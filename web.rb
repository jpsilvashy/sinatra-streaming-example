require 'redis'
require 'sinatra'

get '/' do
  "<pre>curl -v https://sinatra-streaming-example.herokuapp.com/stream</pre>"
end

get '/stream' do
  puts "connection made"

  redis_url = ENV["REDISTOGO_URL"] || "redis://localhost:6379"
  uri = URI.parse(redis_url)
  r = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

  stream do |out|
    r.subscribe 'time' do |on|
      on.message do |channel, message|
        out << "#{message}\n"
      end
    end
  end
end
