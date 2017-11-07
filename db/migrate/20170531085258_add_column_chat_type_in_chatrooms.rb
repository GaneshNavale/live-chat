class AddColumnChatTypeInChatrooms < ActiveRecord::Migration[5.0]

  def change
  	add_column :chatrooms, :chat_type, :string
  end

end
