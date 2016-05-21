class User < ActiveRecord::Base
  has_many :comments
  has_many :books

  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 6..250 }
  validates :password, :confirmation => true
end
