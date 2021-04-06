class User < ActiveRecord::Base
  #gives User model bcrypt authentication methods
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email)
      if user && user.authenticate(password) then user
      else nil
    end
  end
end
