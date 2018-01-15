class FeedbackTrait < ApplicationRecord
	belongs_to :feedback, inverse_of: :feedback_traits
end
