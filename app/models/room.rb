class Room < ApplicationRecord
    #  belongs_to :user
    has_many :reservations
    attachment :image
    
    def self.search(search)
      return Room.all unless search
      Room.where(['content LIKE ?', "%#{search}%"])
    end

validates :image, presence: true
end
