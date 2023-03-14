class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, length: { minimum: 5 }, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    
    email = email.downcase.strip
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else 
      nil
    end
  end
end
