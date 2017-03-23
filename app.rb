require 'sinatra'
require 'sinatra/reloader' if development?
require 'rubygems'
require "bundler/setup"
require 'mysql'
require 'pry'

connection = nil

before do
  connection = Mysql::connect("localhost", "sinatra", "sinatra", "bookmark")
  connection.query("set character set utf8")
end

get '/' do
  erb :index
end

get '/list' do
  list = connection.query("select * from items")
  str = ""
  list.each do |li|
    str += li.join(", ") + "<br>"
  end
  str
end

after do
  connection.close
end