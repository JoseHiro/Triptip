class ChatroomsController < ApplicationController

  def create
    user = User.find(params[:format])
    if user.chat_room_users.present?
      active_chats = User.find(params[:format]).chat_room_users
      chat_exist = false
      chat_room_id = 0

      active_chats.each do |active_chat|
        if current_user.chat_room_users.find_by(chatroom_id:active_chat.chatroom_id)
          chat_exist = true
          chat_room_id = active_chat.chatroom_id
        end
      end
    end

    if !chat_exist
      @chatroom = Chatroom.create
      ChatRoomUser.create(chatroom_id: @chatroom.id, user_id:user.id)
      ChatRoomUser.create(chatroom_id: @chatroom.id, user_id:current_user.id)
      
      redirect_to chatroom_path(@chatroom.id)
    else
      redirect_to chatroom_path(chat_room_id)
    end

  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    if current_user.chat_room_users.presence
      @chating_list = current_user.chat_room_users
    end
  end

end
