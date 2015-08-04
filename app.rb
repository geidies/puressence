$:.unshift File.join(File.dirname(__FILE__))
$:.unshift File.join(File.dirname(__FILE__), 'models')
require 'sinatra'
require 'models/status'

status = Status.instance

get '/' do
  @ticktock = status.get
  erb :index
end

get '/come' do
  status.set true
  redirect '/'
end

get '/go' do
  status.set false
  redirect '/'
end
