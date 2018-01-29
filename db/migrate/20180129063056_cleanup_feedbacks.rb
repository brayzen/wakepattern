class CleanupFeedbacks < ActiveRecord::Migration[5.1]
  def change
    remove_column :feedbacks, :user_rating, :integer
    remove_column :feedbacks, :to_first_name, :string
    remove_column :feedbacks, :to_last_name, :string
    remove_column :feedbacks, :to_email, :string
  end
end
