require 'securerandom'

 helpers do

   def guest_login
     return session[:user_id] = SecureRandom.hex
   end

 end
