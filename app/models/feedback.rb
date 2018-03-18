class Feedback < ApplicationRecord
	belongs_to :sender, class_name: 'User', foreign_key: :sender_id
	belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  has_many :feedback_traits, inverse_of: :feedback, dependent: :destroy
  has_many :traits, through: :feedback_traits
  accepts_nested_attributes_for :feedback_traits, allow_destroy: true, reject_if: proc { |attributes| attributes['rating'].blank? }
  accepts_nested_attributes_for :receiver


	# validate :receiver_check
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

	def receiver_check
		errors.add :email, EmailVerifier.validate(receiver.email)
	end

  alias_method :to_json, :as_json
  def as_json
    to_json({
      only: [:message, :read],
      include: [
        {
          receiver: { only: [], methods: :name }
        },
        {
          feedback_traits: { only: :rating, methods: [:name, :indent] }
        }
      ]
    })
  end
end
