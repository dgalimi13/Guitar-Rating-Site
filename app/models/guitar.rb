class Guitar < ApplicationRecord
  belongs_to :make
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
end
