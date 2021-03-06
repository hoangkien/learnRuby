class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_many :friendships
  has_many :friends, through: :friendships

  EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum:50 }
  validates :email, presence: true, length: { maximum: 255},
                  format: { with: EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
end
