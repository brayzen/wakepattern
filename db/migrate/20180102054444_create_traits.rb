class CreateTraits < ActiveRecord::Migration[5.1]
  def change
    create_table :traits do |t|
      t.index :feedback_id
      t.string :name
      t.integer :rating
    end
  end
end
