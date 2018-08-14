class Question < ApplicationRecord
  has_many :users
  has_many :feedbacks
  has_many :responses, class_name: '::QuestionsResponse'
end
