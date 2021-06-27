class Follower < ApplicationRecord
  belongs_to :users
  belongs_to :reservations
  belongs_to :rooms
end
