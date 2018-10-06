class CreateContexts < ActiveRecord::Migration[5.1]
  def change
    create_table :contexts do |t|
      t.string :name
      t.string :handle
      t.boolean :default
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
