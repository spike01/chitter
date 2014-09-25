env = ENV["RACK_ENV"] || "development"

require 'sinatra'
require './lib/user'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!

  get '/' do
    erb :index 
  end

  post '/signup' do
    @fullname = params["fullname"]
    @email = params["email"]
    @password = params["password"]
    #User.create(fullname: fullname, username: username, email: email)
    erb :signup
  end
    
