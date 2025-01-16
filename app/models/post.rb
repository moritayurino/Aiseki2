class Post < ApplicationRecord
  # validate :user_id, presence: true
  validates :address, presence: true
  validates :title, presence: true
  validates :body, presence: true

  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  belongs_to :genre
  has_many :comments
  has_many :likes
  

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end