class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_guitars, through: :reviews, source: :guitar
    has_many :guitars
end
