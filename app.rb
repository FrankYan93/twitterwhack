require "sinatra"


get '/' do
  erb :index
end

post '/result' do
  
  erb :result
end
