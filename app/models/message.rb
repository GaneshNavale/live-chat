class Message < ApplicationRecord

	default_scope { where(msg_type: 'Group') }

  belongs_to :chatroom
  belongs_to :user
end
