class PersonalChatroom < ApplicationRecord

  self.table_name = 'chatrooms'
  default_scope { where(chat_type: 'Personal') }

  has_many :personal_messages, foreign_key: :chatroom_id, dependent: :destroy

  scope :private_chats_for, ->(user_id) { 
    where('first_user_id = ? OR second_user_id = ?', user_id, user_id) 
  }

  def first_user
    find_user(first_user_id)
  end

  def second_user
    find_user(second_user_id)
  end

  private

  def find_user(user_id)
    User.find(user_id)
  end

end
