require 'redis'
require 'sinatra'

get '/' do
  "<pre>curl -v https://sinatra-streaming-example.herokuapp.com/stream</pre>"
end

get '/stream' do
  puts "connection made"

  uri = URI.parse(ENV["REDISTOGO_URL"])
  r = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

  stream do |out|
    r.subscribe 'time' do |on|
      on.message do |channel, message|
        out << "#{message}\n"
      end
    end
  end
end
