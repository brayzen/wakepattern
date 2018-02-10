class Trait < ActiveRecord::Migration[5.1]
  def change
    create_table :traits do |t|
      t.string  :name
      t.integer :order
      t.integer :indent
    end
  end
end
