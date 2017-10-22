get '/users/:user_id/reviews' do
  @user = User.find(params[:user_id])
  @reviews = @user.reviews
  erb :'reviews/index'
end

get '/users/:user_id/reviews/new' do
  @user = User.find(params[:user_id])
  erb :'reviews/new'
end

post '/users/:id/reviews' do
  @user = User.find(params[:id])
  #add a new review to user, shovel??
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

get '/users/:user_id/reviews/:id' do
  @user = User.find(params[:user_id])
  @review = @user.reviews.find(params[:id])
  erb :'reviews/show'
end

delete '/users/:user_id/reviews/:id' do
  @user = User.find(params[:user_id])
  @review = @user.reviews.find(params[:id])
  @review.destroy
  redirect '/users/#{@user.id}/reviews'
end