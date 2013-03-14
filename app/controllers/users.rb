get '/users/new' do 
	@user = User.new
	erb :"users/new"
end

post '/users/new' do
  if params[:password] == params[:confirm_password]
    password = BCrypt::Password.create(params[:password])
    @user = User.create(name: params[:name], email: params[:email], password_hash: password) 
    redirect ("/users/#{@user.id}")
  else
  	redirect('/users/new')
  end
end

get '/users/:id' do
  redirect ('/') unless User.find(params[:id]) == current_user
	@user = User.find(params[:id])
  erb :"users/show"
end

get '/users/:id/posts' do 
  @user = User.find(params[:id])
  @posts = @user.posts.paginate(:page => params[:page], :per_page => 3)
  erb :"users/posts"
end