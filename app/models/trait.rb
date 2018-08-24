class Trait < ApplicationRecord
  has_many :feedbacks, through: :feedback_traits
  has_many :feeback_traits
end
