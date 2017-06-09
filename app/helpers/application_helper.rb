module ApplicationHelper
	
	def user_friend_requests
		FriendRequest.where(user_id: current_user.id)
	end

end
