before do
	# @posts = Post.all
	@posts = Post.paginate(:page => params[:page], :per_page => 3)


	@tags = Tag.all
end

get '/' do
  erb :index
end
