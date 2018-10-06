class Question < ApplicationRecord
  has_many :questions_users
  has_many :users, through: :questions_users
  has_many :feedbacks
  has_many :responses, class_name: '::QuestionsResponse'
end
