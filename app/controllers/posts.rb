get '/posts/new' do
	@post = Post.new
  erb :"posts/new"
end

post '/posts/new' do
	@post = Post.create(title: params[:title], content: params[:content])
	if @post.valid?
		tags = params[:tags].split(" ")
		tags.each do |tag|
			puts "weeeeeeee#{@post.id}"
		  new_tag =  Tag.find_by_name(tag.downcase) || Tag.create(name: tag.downcase)
		  PostsTag.create(post_id: @post.id, tag_id: new_tag.id) unless PostsTag.exists?(post_id: @post.id, tag_id: new_tag.id) 
		end
		redirect ("/posts/#{@post.id}")
	else
		erb :"posts/new"
	end
end

get '/posts/:id' do 
	@post = Post.find(params[:id])
	erb :"posts/show"
end

get '/posts/:id/edit' do 
	@post = Post.find(params[:id])
	erb :"posts/edit"
end

put '/posts/:id/edit' do 
	post = Post.find(params[:id])
	post.title = params[:title]
	post.content = params[:content]
	post.save
	puts post
	redirect ('/')
end

delete '/posts/:id/delete' do 
	post = Post.find(params[:id])
	post.destroy
	redirect ('/')
end 





