class User < ActiveRecord::Base
  #give User model bcrypt authentication methods
  has_secure_password
end
