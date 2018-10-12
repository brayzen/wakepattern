class User < ApplicationRecord
  attr_accessor :login
  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: { login: true }

  validates :handle, uniqueness: true, format: { without: /@/, message: "handle must not contain '@'" }

  validates_uniqueness_of :email

  has_many :sent_feedbacks, class_name: 'Feedback', foreign_key: :sender_id
  has_many :received_feedbacks, class_name: 'Feedback',  foreign_key: :receiver_id
  has_many :received_feedback_traits, through: :received_feedbacks, source: :feedback_traits
  has_many :responses, through: :feedbacks
  has_many :contexts
  has_many :questions_users
  has_many :questions, through: :questions_users
#  accepts_nested_attributes_for :questions, allow_destroy: true
  
  fuzzily_searchable :name

  before_save :pre_save, unless: Proc.new{ |user| user.guest? }

  def find_by_handle(handle)
    super handle.downcase
  end

  def pre_save
    handle.downcase! if handle.present?
  end

  def guest?
    first_name == 'guest'
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name_changed?
    first_name_changed? || last_name_changed?
  end

  def self.create_from_omniauth(params)
    # this will probably fail with some more complicated names
    names = params['info']['name'].split ' '
    attributes = {
      first_name: names[0],
      last_name: names[1],
      email: params['info']['email'],
      password: Devise.friendly_token
    }

    create attributes
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete :login
    where(conditions).where(["lower(handle) = :value OR lower(email) = :value", { value: login.strip.downcase }]).first
  end

  def received_trait_averages
    FeedbackTrait.averages received_feedback_traits, decimal_place: 1
  end
end
