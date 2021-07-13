class Reservation < ApplicationRecord
    belongs_to :room
    
   validates :begin_day, presence: true, on: :create
    validates :finish_day, presence: true, on: :create
end