class FeedbackTrait < ApplicationRecord
	belongs_to :feedback, inverse_of: :feedback_traits
  belongs_to :trait

  def name
    trait.name
  end

  def indent
    trait.indent
  end

end
