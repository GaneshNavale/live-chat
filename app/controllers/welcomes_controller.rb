class WelcomesController < ApplicationController

  def index
	   @chatrooms = Chatroom.all
	   @personal_chats = PersonalChatroom.private_chats_for(current_user.id)     
  end

  def search_users
  	if params[:first_name].present? || params[:last_name].present?
  		@users = User.search_by_full_name(params[:first_name], params[:last_name])
  	end
	end

  def friends
    @friends = current_user.friends
  end

end