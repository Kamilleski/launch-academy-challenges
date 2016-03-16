class Meetup < ActiveRecord::Base
  belongs_to :creator, class_name: :User
  has_many :meetup_participants
  has_many :users, through: :meetup_participants
end
