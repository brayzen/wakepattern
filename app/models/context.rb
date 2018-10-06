class Context < ApplicationRecord
  belongs_to :user
  has_many :questions_users
  has_many :questions, through: :questions_users
end
