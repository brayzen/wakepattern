class AddResponsesToTraits < ActiveRecord::Migration[5.1]
  def change
  	add_column(:feedback_traits, :response, :text)
  end
end
