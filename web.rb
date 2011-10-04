require 'redis'
require 'sinatra'

get '/' do
  "curl https://sinatra-streaming-example.herokuapp.com/stream"
end

get '/stream' do
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
