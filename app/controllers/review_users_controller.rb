get '/users/:id/reviews' do
  @user = User.find(params[:id])
  @reviews = @user.reviews
  erb :'reviews/index'
end

get '/users/:id/reviews/new' do
  @user = User.find(params[:id])
  erb :'reviews/new'
end

post '/users/:id/reviews' do
  @user = User.find(params[:id])
  @review = @user.reviews.new(params[:review])
  if @review.save
    if request.xhr?
      erb :'reviews/_show', layout: false, locals: { review: @review}
    else
      redirect "/"
    end
  else
    if request.xhr?
      status 422
      @errors = @review.errors.full_messages
      erb :'_errors', layout: false
    else
      erb :'reviews/new'
    end
  end
end

get '/users/:id/reviews/:id' do
  @user = User.find(params[:id])
  @review = @user.reviews.find(params[:id])
  erb :'reviews/show'
end

delete '/users/:id/reviews/:id' do
  @user = User.find(params[:id])
  @review = @user.reviews.find(params[:id])
  @review.destroy
  redirect '/users/#{@user.id}/reviews'
end