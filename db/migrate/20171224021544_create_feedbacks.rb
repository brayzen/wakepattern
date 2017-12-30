class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
			t.text     :message
      t.integer  :user_rating
			t.boolean  :flagged, default: false
			t.boolean  :anonymous, default: true
			t.boolean  :read
			t.string   :to_first_name
			t.string   :to_last_name
			t.string   :to_email

      t.timestamps
    end
  end
end
