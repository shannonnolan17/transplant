get '/reviews' do
  @reviews = Review.all
  erb :'reviews/index'
end

get '/reviews/new' do
  @review = Review.new()
  erb :'reviews/new'
end

post '/reviews' do
  @review = Review.new(params[:review])
  if @review.save
    redirect "/reviews/#{@review.id}"
  else
    @errors = @review.errors.full_messages
    erb :'reviews/new'
  end
end

get '/reviews/:id' do
  @review = Review.find(params[:id])
  erb :'reviews/show'
end

get '/reviews/:id/edit' do
  @review = Review.find(params[:id])
  erb :'reviews/edit'
end

put '/reviews/:id' do
  @review = Review.find(params[:id])
  @review.update_attributes(params[:review])
  redirect "/reviews/#{@review.id}"
end

delete '/reviews/:id' do
  @review = Review.find(params[:id])
  @review.destroy
  redirect '/'
end