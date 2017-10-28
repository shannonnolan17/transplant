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
  if logged_in?
    if request.xhr?
      erb :'reviews/new', layout: false
    else
      erb :"reviews/new"
    end
  else
    redirect '/sessions/new'
  end
end

post '/reviews' do
  @review = Review.new(params[:review])
  if @review.save
    if request.xhr?
      erb :'reviews/new', layout: false, locals: { review: review}
    else
      redirect "/reviews/#{@review.id}"
    end
  else
    @errors = @review.errors.full_messages
    if request.xhr?
      status 422
      erb :'_errors', layout: false
    else
      erb :'reviews/new'
    end
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
  if request.xhr?
    if params[:favorite] == true
      current_user.reviews << @review
    end
  else
    @review.assign_attributes(params[:review])
    if @review.save
      redirect "/reviews/#{@review.id}"
    else
      erb :'reviews/edit'
    end
  end
end

delete '/reviews/:id' do
  @review = Review.find(params[:id])
  @review.destroy
  redirect '/'
end