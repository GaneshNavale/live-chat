class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :rememberable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  has_many :messages
  has_many :chatrooms, through: :messages

  validates :username, :email, presence: true, uniqueness: true
end
