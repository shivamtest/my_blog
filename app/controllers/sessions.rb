get '/users/login' do
  erb :"users/login"
end

post '/users/login' do
  if User.login(params[:email], params[:password])
    token = SecureRandom.hex(10)
    session[:token] = token
    user = User.find_by_email(params[:email])
    user.token = token
    user.save
    current_user
    redirect ("/users/#{user.id}")
  else
    redirect ('/users/login')
  end
end


delete '/users/logout' do
  session[:token] = nil 
  redirect '/'
end