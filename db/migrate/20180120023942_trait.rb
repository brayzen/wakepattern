class Trait < ActiveRecord::Migration[5.1]
  def change
    create_table :traits do |t|
      t.string  :name
      t.integer :order
      t.integer :indent
    end

    # we had an extra table
    drop_table :feedback_trait

    add_reference :feedback_traits, :trait
    remove_column :feedback_traits, :name
  end
end
