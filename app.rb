require 'sinatra'
require 'sinatra/reloader' if development?
require 'rubygems'
require "bundler/setup"
require 'mysql'
require 'pry'

connection = nil

before do
  # connection = Mysql::connect("hostname", "username", "password", "dbname")
  connection = Mysql::connect("localhost", "sinatra", "sinatra", "bookmark")
  connection.query("set character set utf8")
end

get '/' do
  erb :index
end

get '/form' do
  erb :form
end

post '/regist' do
  name = params[:name]
  url = params[:url]
  connection.query("insert into items (name, url) values ('#{name}', '#{url}')")
  erb :regist
end

get '/list' do
  list = connection.query("select * from items") # array
  @str = ""
  list.each do |li|
    @str += li.join(", ") + "<br>"
  end
  erb :list
end

after do
  connection.close
end