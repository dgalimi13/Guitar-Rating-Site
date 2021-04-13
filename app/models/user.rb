class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_guitars, through: :reviews, source: :guitar

  has_many :guitars 

  validates :username, uniqueness: true,  presence: true
  validates :email, presence: true

  has_secure_password
end
