before /users\/\d/  do
  redirect '/sessions/new' unless logged_in?
end

get '/users' do
  erb :'users/index'
end

get '/users/new' do
  @user = User.new()
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id'do
  @user = User.find(params[:id])
  erb :'users/show'
end