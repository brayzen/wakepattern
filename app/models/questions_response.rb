class QuestionsResponse < ApplicationRecord
  belongs_to :question
  belongs_to :feedback, optional: true
end
