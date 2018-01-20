class Trait < ApplicationRecord
  has_many :feedbacks, through: :feedback_traits
end
