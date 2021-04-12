class User < ApplicationRecord
    has_many :reviews
    has_many :guitars, through :reviews
    has_many :guitars
end
