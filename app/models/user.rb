class User < ApplicationRecord
  has_secure_password

  has_many :reviews

  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.authenticate_with_credentials(email, password)
    new_email = email.downcase.strip
    user = User.find_by_email(new_email)
    user && user.authenticate(password) ? user : nil
  end
  
end
