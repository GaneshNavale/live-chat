class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :rememberable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  has_many :messages
  has_many :personal_messages
  has_many :chatrooms, through: :messages
  has_many :personal_chatrooms, through: :messages
  
  has_many :first_user_chatrooms, foreign_key: :first_user_id, class_name: 'PersonalChatroom'
  has_many :second_user_chatrooms, foreign_key: :second_user_id, class_name: 'PersonalChatroom'
  has_many :friend_requests, -> { where(status: 'accepted') }
  has_many :requested_friends_requests, -> { where(status: 'accepted') }, class_name: 'FriendRequest', foreign_key: 'requested_by_id'
  has_many :accepted_friends, through: :friend_requests, source: :requested_by
  has_many :requested_friends, through: :requested_friends_requests, source: :user

  validates :username, :email, presence: true, uniqueness: true

  def full_name
  	"#{first_name} #{last_name}"
  end

	def self.search_by_full_name(first_name, last_name)
    if first_name.present? && last_name.present?
      where('lower(first_name) LIKE ? AND lower(last_name)  LIKE ? ', "%#{first_name.downcase}%", "%#{last_name.downcase}%")     
    elsif first_name.present?
      where('lower(first_name) LIKE ? ', "%#{first_name.downcase}%")
    elsif last_name.present?
      where('lower(last_name) LIKE ? ', "%#{last_name.downcase}%")
    end      
	end

  def friend_request?(user_id)
    friend_requests.where(requested_by_id: user_id).present?
  end

  def friends
    (accepted_friends + requested_friends)
  end

end