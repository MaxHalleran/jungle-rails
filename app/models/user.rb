require 'pp'

class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email, password)
    formatted_email = email.strip.downcase
    (User.where("lower(email) = ?", formatted_email).first).try(:authenticate, password)
  end

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 6 }

end
