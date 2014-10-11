get '/' do
  @peeps = Peep.all
  erb :index 
end

get '/preview' do
  @peeps = Peep.all
  erb :preview
end
