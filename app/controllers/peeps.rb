get '/create/peep' do
  erb :newpeep
end

post '/create/peep' do
  content = params[:content]
  params[:timestamp] = Time.now
  peep = current_user.peeps.create(content: content, timestamp: Time.now)
  redirect '/'
end
