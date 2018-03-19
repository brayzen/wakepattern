class User < ApplicationRecord
  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :handle, uniqueness: true

	validates_uniqueness_of :email

  has_many :sent_feedbacks, class_name: 'Feedback', foreign_key: :sender_id
  has_many :given_feedbacks, class_name: 'Feedback',  foreign_key: :receiver_id

  fuzzily_searchable :name

  before_save :pre_save, unless: Proc.new{ |user| user.guest? }

  def pre_save
    handle.downcase!
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
end
