env = ENV["RACK_ENV"] || "development"

require 'sinatra'
require './lib/user'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'shhhh'

  get '/' do
    erb :index 
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @fullname = params["fullname"]
    @email = params["email"]
    @password = params["password"]
    erb :signup
  end

  post '/account/create' do
    fullname = params["fullname"]
    email = params["email"]
    username = params["username"]
    password = params["password"]
    user = User.create(fullname: fullname, username: username, email: email, password: password)
    session[:user_id] = user.id
    redirect '/'
  end

  post '/sessions' do
    username = params["login-uname"]
    password = params["login-pword"]
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect '/'
    else 
      puts "The username and password you entered did not match our records. Please double-check and try again."
      redirect '/signin'
    end
  end

  get '/signin' do
    erb :signin
  end


helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end

