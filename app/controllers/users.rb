post '/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    sesion[:user_id] = user.id
    redirect "/users/#{user.id}/profile"
  else
    erb :sign_in
  end
end

get '/sign_up/new' do
  erb :sign_up
end

post '/sign_up' do
  user = User.new(last_name: params[:last_name], first_name: params[:first_name], user_name: params[:user_name], email: params[:email], password: params[:password])
  user.save
  if user.save
    redirect "/users/deck_view"
  end
end

get '/logout' do
  sessions.delete(:user_id)
  redirect '/'
end
