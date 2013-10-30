########### GET

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/secret' do
  erb :secret
end

get '/list' do
  redirect('/')
end

########### POST

post '/create' do
  User.create(params[:user])
  redirect('/')
end

post '/login' do
  @user = User.find_by_email(params[:user][:email])
  if @user.password == params[:user][:password]
    session[:user_id] = @user.id
    redirect('/secret')
  else
    redirect('/')
  end
end

post '/logout' do
  session.clear
  redirect('/')
end
