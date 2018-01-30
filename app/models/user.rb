class User < ApplicationRecord
  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :sent_feedbacks, class_name: 'Feedback', foreign_key: :sender_id
  has_many :given_feedbacks, class_name: 'Feedback',  foreign_key: :receiver_id

  def self.create_from_omniauth(params)
    attributes = {
      name: params['info']['name'],
      email: params['info']['email'],
      password: Devise.friendly_token
    }

    create attributes
  end
end
