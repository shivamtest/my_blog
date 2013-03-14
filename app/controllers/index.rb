before do
	@posts = Post.all
	@tags = Tag.all
end

get '/' do
  erb :index
end
