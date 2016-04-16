get '/guest/deck_view' do
  guest_login
  erb :deck_view
end
