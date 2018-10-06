class QuestionsUser < ApplicationRecord
  belongs_to :user
  belongs_to :context
  belongs_to :question
end
