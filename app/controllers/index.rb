get '/' do
	if session[:user_id]
		# user = User.find(session[:user_id])
		redirect "/users/#{session[:user_id]}/decks"
	else
		erb :sign_in
	end
end
