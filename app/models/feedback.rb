class Feedback < ApplicationRecord
	belongs_to :sender, class_name: 'User', foreign_key: :sender_id
	belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id
  has_many :feedback_traits, inverse_of: :feedback, dependent: :destroy
  has_many :traits, through: :feedback_traits
  has_many :responses, class_name: 'QuestionsResponse'
  accepts_nested_attributes_for :responses, allow_destroy: true

  has_many :questions, through: :receiver
  accepts_nested_attributes_for :feedback_traits, allow_destroy: true, reject_if: proc { |attributes| attributes['rating'].blank? }
  accepts_nested_attributes_for :receiver
  validate :receiver_sender_uniqness


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

  def display_created
    created_at.strftime "%Y \/ %m \/ %d"
  end

  def as_json(options)
    super( only: [:id, :message, :read],
      methods: [:created_at],
      include: [
        {
          receiver: { only: [], methods: :name }
        },
        {
          feedback_traits: { only: :rating, methods: [:name, :indent] }
        }
      ]
    )
  end

private
  def receiver_sender_uniqness
    if sender_id == receiver_id
      errors.add :sender, "No sending feedback to yourself. But, What would you say?"
    end
  end
end
