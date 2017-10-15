#all
get '/users' do
  erb :'users/index'
end

#new
get '/users/new' do
  @user = User.new()
  erb :'users/new'
end

#create
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

#one user
get '/users/:id'do
  @user = User.find(params[:id])
  erb :'users/show'
end