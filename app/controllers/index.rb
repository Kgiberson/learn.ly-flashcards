# get '/' do
#   if session[:user_id].is_a? Integer
#     redirect "/users/deck_view"
#   elsif session[:user_id].is_a? String
#     redirect "/guests/deck_view"
#   else
#     erb :sign_in #might change
#   end
# end
