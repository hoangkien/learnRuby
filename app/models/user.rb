class User < ActiveRecord::Base
  has_secure_password

  validates :full_name, presence: true, length: { in: 6..50 }
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }
end