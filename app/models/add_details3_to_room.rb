class AddDetails3ToRoom < ApplicationRecord
  belongs_to :user
  belongs_to :rooms
  belongs_to :reservations
end
