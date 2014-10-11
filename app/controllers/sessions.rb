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
