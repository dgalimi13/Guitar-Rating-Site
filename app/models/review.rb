class Review < ApplicationRecord
  belongs_to :user
  belongs_to :guitar

  validates :title, presence: true
  validates :stars, numericality: true, greater_than_or_equal_to: 0, less_than: 6
end
