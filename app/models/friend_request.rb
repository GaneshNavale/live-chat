class FriendRequest < ApplicationRecord
  
  include AASM

	belongs_to :user
  belongs_to :requested_by, class_name: 'User', foreign_key: 'requested_by_id'

  aasm column: :status do

    state :pending, initial: true
    state :accepted, :rejected

    event :accept do
      transitions from: :pending, to: :accepted
    end

    event :reject do
    	transitions from: :pending, to: :rejected
  	end
    
  end

end
