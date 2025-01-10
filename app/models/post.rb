class Post < ApplicationRecord
  # validate :user_id, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
