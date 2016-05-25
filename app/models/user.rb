require 'bcrypt' # idk if really needed

class User < ActiveRecord::Base
  include BCrypt

  has_many :comments
  has_many :books

  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { in: 6..72 }
  validates :password, :confirmation => true

  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
end
