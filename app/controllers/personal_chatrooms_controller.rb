class PersonalChatroomsController < ApplicationController

	def show
		user = User.find(params[:id])
		@chatroom = PersonalChatroom.private_chats_for(current_user.id).private_chats_for(user.id).last
		unless @chatroom.present?
			 @chatroom = PersonalChatroom.create(first_user_id: user.id, second_user_id: current_user.id)
		end
		@message = PersonalMessage.new
		render 'chatrooms/show'
	end

end