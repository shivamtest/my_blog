get '/tag/:name' do 
	@tag = Tag.find_by_name(params[:name])
	@posts = @tag.posts
	erb :"tags/show"
end