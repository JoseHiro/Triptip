class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_one_attached :photo
  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy


  private

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
