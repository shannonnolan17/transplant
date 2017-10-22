get '/users/:user_id/reviews' do
  @user = User.find(params[:user_id])
  @reviews = @user.reviews
  erb :'reviews/index'
end

get '/users/:user_id/reviews/new' do
  @user = User.find(params[:user_id])
  erb :'reviews/new'
end

post '/users/:user_id/reviews' do
  @user = User.find(params[:user_id])
  @review = @user.reviews.new(params[:review])
  if request.xhr?
    content_type :json
    ({id: @review.id, user: @user.id}.to_json)
  else
    redirect "/"
  end
  if @review.save
    redirect "/users/#{@user.id}/reviews"
  else
    erb :'reviews/new'
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