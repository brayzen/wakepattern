class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :text
    end

    create_table :questions_users do |t|
      t.references :question
      t.references :user
    end

    create_table :questions_responses do |t|
      t.references :question
      t.references :feedback
      t.string :response
    end
  end
end
