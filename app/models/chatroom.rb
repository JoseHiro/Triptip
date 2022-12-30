class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :chat_room_users, dependent: :destroy
end
