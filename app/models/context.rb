class Context < ApplicationRecord
  belongs_to :user
  has_many :questions_users, dependent: :destroy
  has_many :questions, through: :questions_users
  accepts_nested_attributes_for :questions
  validates :name, uniqueness: { scope: :user }
end
