class PersonalMessagesController < ApplicationController

  def create
    message = PersonalMessage.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.full_name,
        time: message.created_at.to_s(:time)
      head :ok
    end
  end

  private

    def message_params
      params.require(:personal_message).permit(:content, :chatroom_id)
    end
end