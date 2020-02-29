class AuthenticateUser < ApplicationRecord
  
  class << self
    def encode(password)
      OpenSSL::HMAC.hexdigest("SHA256", Rails.application.secrets.secret_key_base, password)
    end

    def verify(token, password)
      new_hash = OpenSSL::HMAC.hexdigest("SHA256", Rails.application.secrets.secret_key_base, password)
      token == new_hash
    end


  # private
  
  # def user
  #   user = User.find_by_email('email')
  #   return user if user && user.authenticate(password)
    
  #   errors.add :user_authentication, 'invalid credentials'
  #   nil
  # end
end
