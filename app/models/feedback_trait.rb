class FeedbackTrait < ApplicationRecord
	belongs_to :feedback, inverse_of: :feedback_traits

  def trait
    @trait ||= Trait.find trait_id
  end

  def name
    trait.name
  end

  def indent
    trait.indent
  end
end
