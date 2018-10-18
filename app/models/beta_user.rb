class BetaUser < ApplicationRecord
	validates :email, presence: true
	validates_length_of :phone, minimum: 10, maximum: 10, allow_blank: true, message: 'phone number must be 10 digits or none at all, email will work!'
end
