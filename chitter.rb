env = ENV["RACK_ENV"] || "development"

require 'sinatra'
require 'rack-flash'

require './lib/user'
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
require './lib/user'
DataMapper.finalize
DataMapper.auto_upgrade!

use Rack::Flash
use Rack::MethodOverride

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
    user = User.from(params)
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else 
      flash.now[:errors] = user.errors.full_messages
      @fullname = params["fullname"]
      @password = params["password"]
      @username = params["username"]
      erb :signup 
    end
  end

  post '/sessions' do
    username = params["login-uname"]
    password = params["login-pword"]
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect '/'
    else 
      flash[:notice] = "The username and password you entered did not match our records. Please double-check and try again."
      redirect '/signin'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil 
    redirect '/'
  end

  get '/signin' do
    erb :signin
  end


helpers do

  def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
  end

end

