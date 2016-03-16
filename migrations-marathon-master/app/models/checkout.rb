class Checkout < ActiveRecord::Base
  belongs_to :book
  
  validates :customer_name, presence: true
  validates :book, presence: true
end
