class CreateFriendRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_requests do |t|
    	t.integer :user_id
    	t.integer :requested_by_id
    	t.datetime :accepted_at
      t.timestamps
    end
  end
end
