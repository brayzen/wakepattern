class CreateJoinTableFeedbackTraits < ActiveRecord::Migration[5.1]
  def change
		create_join_table :feedback, :trait do |t|
			t.index [:feedback_id, :trait_id]
			t.index [:trait_id, :feedback_id]
			t.integer :rating, limit: 10
			t.text :direct_feedback
		end
  end
end
