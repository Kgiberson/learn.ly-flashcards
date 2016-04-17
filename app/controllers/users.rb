get '/login' do
  erb :sign_in
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}/profile"
  else
    erb :sign_in
  end
end

get '/guest/login' do
  guest = guest_login
  redirect "/users/#{guest}/decks"
end

get '/sign_up/new' do
  erb :sign_up
end

post '/sign_up' do
  user = User.new(last_name: params[:last_name], first_name: params[:first_name], user_name: params[:user_name], email: params[:email], password: params[:password])
  user.save
  if user.save
    redirect "/users/#{user.id}/decks"
  end
end

get '/users/:user_id/decks' do
  erb :deck_view
end

get '/logout' do
  sessions.delete(:user_id)
  redirect '/'
end

get '/users/:user_id/decks/:id' do
  # deck = Deck.find(params[:id])
  # user = User.find(session[:user_id])
  # user.round.create()
  @cards = Card.where(deck_id: params[:id])
  session[:cards] = @cards
  erb :round
end

post '/users/:user_id/decks/:id' do
  cards = session[:cards]

  answers = params[answer]
end
