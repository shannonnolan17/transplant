get '/reviews' do
  @reviews = Review.all
  if request.xhr?
    erb :"reviews/index", layout: false
  else
    erb :'reviews/index'
  end
end

get '/reviews/new' do
  @review = Review.new()
  erb :"tasks/new"
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
  @review.assign_attributes(params[:review])
  if @review.save
    redirect "/reviews/#{@review.id}"
  else
    erb :'reviews/edit'
  end
end

delete '/reviews/:id' do
  @review = Review.find(params[:id])
  @review.destroy
  redirect '/'
end