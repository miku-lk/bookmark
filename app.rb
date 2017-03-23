require 'sinatra'
require 'sinatra/reloader' if development?
# require 'rubygems'
# require 'mysql'
#
# before do
#   connection = Mysql::connect("localhost", "sinatra", "sinatra", "bookmark")
#   connection.query("set character set utf8")
# end

get '/' do
  erb :index
end

get '/list' do
  # list = connection.query("select * from items")
  # list.each do |li|
  #   puts li.join ", "
  # end
end

# after do
#   connection.close
# end