get '/' do
  if session[:user_id].integer? == true
    redirect "/users/deck_view"
  elsif session[:user_id].integer? == false
    redirect "/guests/deck_view"
  else
    erb :sign_in #might change
  end
end
