class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true, prescence: true

    has_many :reviews
    has_many :reviewed_guitars, through: :reviews, source: :guitar
    has_many :guitars
end
