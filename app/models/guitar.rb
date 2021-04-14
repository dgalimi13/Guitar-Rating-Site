class Guitar < ApplicationRecord
  belongs_to :make
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :make

  validates :kind, presence: true
  validate :not_a_duplicate

  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(stars) desc')}

    def self.alpha
      order(:kind)
    end 


    def make_attributes=(attributes)
      make = Make.find_or_create_by(attributes) if !attributes['name'].empty?
    end

    def not_a_duplicate
      if Guitar.find_by(kind: kind, make_id: make_id)
      errors.add(:kind, "has already been added for that make")
    end 
  end

  def kind_and_make
    "#{kind} - #{make.name}"
  end 

end
 