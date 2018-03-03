class RemoveNameFromFeedbackTraits < ActiveRecord::Migration[5.1]
  def change
    remove_column :feedback_traits, :name, :string
  end
end
