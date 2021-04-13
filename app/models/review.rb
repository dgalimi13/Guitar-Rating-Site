class Review < ApplicationRecord
  belongs_to :user
  belongs_to :guitar

  validates :title, presence: true
end
