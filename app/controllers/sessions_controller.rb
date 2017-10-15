#new
get '/sessions/new' do
  @user = User.new()
  erb :'sessions/new'
end

#create
post '/sessions' do
  p "*" * 100
  p params
  @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
  else
    @errors = ["Email or password is incorrect"]
    erb :'sessions/new'
  end
end

#delete
delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end