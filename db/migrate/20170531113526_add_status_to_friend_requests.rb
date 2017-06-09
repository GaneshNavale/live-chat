class AddStatusToFriendRequests < ActiveRecord::Migration
  def change
    add_column :friend_requests, :status, :string
  end
end
