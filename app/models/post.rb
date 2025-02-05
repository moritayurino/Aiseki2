class Post < ApplicationRecord
  # validate :user_id, presence: true
  validates :address, presence: true, length: { maximum: 100 }
  validates :title, presence: true
  validates :body, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true


  geocoded_by :address
  after_validation :geocode, :latitude, :longitude
  belongs_to :user
  belongs_to :genre
  has_many :comments
  has_many :likes
  

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
  class << self
    def within_box(distance, latitude, longitude)
      distance = distance
      center_point = [latitude, longitude]
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      self.within_bounding_box(box)
    end
  end

end