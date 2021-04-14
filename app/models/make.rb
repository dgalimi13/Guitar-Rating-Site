class Make < ApplicationRecord
    has_many :guitars
    validates :name, presence: true, uniqueness: true
    
end
