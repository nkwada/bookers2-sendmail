class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    #stream_from "room_channel_#{params['room']}"
    stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    binding.pry
    Chatrerrrer.create! message: data['chat'], user_id:  data['current_user.id'], room_id: params['room']
    #render_message = ApplicationController.renderer.render(partial: 'chats/chat' )
    #ActionCable.server.broadcast 'channel'
  end
end