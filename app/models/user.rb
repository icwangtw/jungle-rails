class User < ActiveRecord::Base

  has_many :reviews
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def self.authenticate_with_credentials(email, pw)
    user = User.find_by_email(email)
    if user && user.authenticate(pw)
      user
    else
      nil
    end
  end


end
