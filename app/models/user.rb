class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar
  has_one :location
  has_many :chatrooms
  has_many :messages
  has_many :chat_room_users
  has_one :about, dependent: :destroy

  private

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def already_have_address?
    self.location.presence == nil
  end

end
