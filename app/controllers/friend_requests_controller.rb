class FriendRequestsController < ApplicationController

	def index
		@friend_requests = user_friend_requests.pending
	end

	def create
		user = User.find(params[:user_id])
		friend_request = FriendRequest.new(user_id: user.id)
		friend_request.requested_by_id = current_user.id
		friend_request.save
		redirect_to welcomes_path
	end

	def accept
		friend_request = FriendRequest.find(params[:id])	
		friend_request.accept!
		redirect_to welcomes_path
	end

	def show
		friend_requests = current_user.friend_requests
	end

	def destroy
		user = User.find(params[:id])
		friend_request = user.friend_requests.where(requested_by_id: current_user.id).last ||
			current_user.friend_requests.where(requested_by_id: user.id).last
		friend_request.destroy
		redirect_to welcomes_path
	end

end