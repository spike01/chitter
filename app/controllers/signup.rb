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
