class Book < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :checkouts
  
  validates :title, presence: true
  validates :ratings, numericality: true
  validates :ratings, inclusion: { in: 0..100}
end
