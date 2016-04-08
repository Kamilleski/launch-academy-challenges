class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer_id, presence: true
  validates :color, presence: true
  validates :year, numericality: { :greater_than_or_equal_to => 1920 }
  validates :mileage, numericality: { :greater_than_or_equal_to => 0 }
end
