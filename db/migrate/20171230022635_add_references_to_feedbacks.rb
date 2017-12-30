class AddReferencesToFeedbacks < ActiveRecord::Migration[5.1]
  def change
		# add_reference :to, :user, foreign_key: true
		# add_reference :from, :user, foreign_key: true
		add_reference :feedbacks, :sender, index: true, foreign_key: true
		add_reference :feedbacks, :receiver, index: true, foreign_key: true
  end
end
