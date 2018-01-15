class CreateFeedbackTraits < ActiveRecord::Migration[5.1]
  def change
    create_table :feedback_traits do |t|
      t.integer :feedback_id
      t.index :feedback_id
      t.string :name
      t.integer :rating
    end
  end
end
