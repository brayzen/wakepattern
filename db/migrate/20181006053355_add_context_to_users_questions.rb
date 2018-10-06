class AddContextToUsersQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions_users, :context, foreign_key: true

    User.all.each do |user|
      if user.questions.count > 0
        context = user.contexts.build(name: 'default', handle: 'default')
        context.save!
        user.questions_users.each do |qu|
          qu.update_attribute(:context, context)
        end
      end
    end
  end
end
