class Feedback < ApplicationRecord
	belongs_to :sender, class_name: 'User', foreign_key: :sender_id
	belongs_to :reciever, class_name: 'User', foreign_key: :receiver_id
end
