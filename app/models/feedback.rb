class Feedback < ApplicationRecord
  TRAIT_NAMES = %w{ helpful dependable productive communication listening speech understanding charisma friendliness composure complainer }
  TRAIT_HEIRARCHY = { helpful: 0, dependable: 1, productive: 1, communication: 0, listening: 1, speech: 1, understanding: 1, charisma: 0, friendliness: 1, composure: 1, complainer: 1 }

	belongs_to :sender, class_name: 'User', foreign_key: :sender_id
	belongs_to :reciever, class_name: 'User', foreign_key: :receiver_id
  has_many :feedback_traits, inverse_of: :feedback, dependent: :destroy
  accepts_nested_attributes_for :feedback_traits, allow_destroy: true, reject_if: proc { |attributes| attributes['rating'].blank? }

  alias_method :active_feedback_traits, :feedback_traits

  def new_traits
    TRAIT_NAMES.map do |trait_name|
      self.feedback_traits.build name: trait_name
    end
  end
end
