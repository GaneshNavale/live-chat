class PersonalMessage < ApplicationRecord

	self.table_name = 'messages'
  
  default_scope { where(msg_type: 'Personal') }

  belongs_to :personal_chatroom, class_name: 'PersonalChatroom', foreign_key: :chatroom_id
  belongs_to :user

end