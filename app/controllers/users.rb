get '/login' do
  erb :sign_in
end

post '/login' do
  @user = User.find_by(user_name: params[:user_name])
  if @user.authenticate(params[:password])
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
  @id = params[:user_id]
  erb :deck_view
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/users/:user_id/decks/:id' do
  @deck = Deck.find(params[:id])
  @id = params[:user_id]
  @cards = Card.where(deck_id: @deck.id)
  erb :round
end


post '/users/:user_id/decks/:id' do
  @cards = Card.where("deck_id = ?", params[:id].to_i)
  @deck = Deck.find(params[:id].to_i)


  @user_answers = [params[:answer1],params[:answer2],params[:answer3],params[:answer4],params[:answer5],params[:answer6],params[:answer7],params[:answer8],params[:answer9],params[:answer10]]

  @wrong_cards = []
    @cards.each_with_index do |card, i| 
      if card.answer != @user_answers[i]
        @wrong_cards << card
      end
    end

  @number_correct = @cards.length - @wrong_cards.length

  @user_id = params[:user_id]
  
  erb :results
end



















