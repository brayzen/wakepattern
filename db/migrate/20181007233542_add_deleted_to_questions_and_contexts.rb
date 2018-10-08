class AddDeletedToQuestionsAndContexts < ActiveRecord::Migration[5.1]
  def change
    add_column :questions_users, :deleted, :boolean
    add_column :contexts, :deleted, :boolean
  end
end
