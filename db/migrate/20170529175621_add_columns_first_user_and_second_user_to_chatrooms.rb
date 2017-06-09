class AddColumnsFirstUserAndSecondUserToChatrooms < ActiveRecord::Migration[5.0]
  def change
  	add_column :chatrooms, :first_user_id, :integer
  	add_column :chatrooms, :second_user_id, :integer
  end
end
