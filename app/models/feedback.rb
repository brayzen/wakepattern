class Feedback < ApplicationRecord
	belongs_to :sender, class_name: 'User', foreign_key: :sender_id
	belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  has_many :feedback_traits, inverse_of: :feedback, dependent: :destroy
  has_many :traits, through: :feedback_traits
  accepts_nested_attributes_for :feedback_traits, allow_destroy: true, reject_if: proc { |attributes| attributes['rating'].blank? }

  alias_method :active_feedback_traits, :feedback_traits

  def all_traits
    existing_traits = feedback_traits.map{ |trait| trait.name }
    Trait.all
      .reject{ |trait| existing_traits.include? trait.name }
      .sort{ |a,b| a.order <=> b.order }
      .map do |trait|
        feedback_traits.build trait_id: trait.id
    end
  end

  def to_first_name
    receiver&.name
  end

  def to_last_name
    receiver&.name
  end

  def to_email
    receiver&.email
  end
end
