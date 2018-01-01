class Trait < ApplicationRecord
	belongs_to :feedbacks, through: :feedback_traits
end
