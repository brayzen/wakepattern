class AddGroupToTrait < ActiveRecord::Migration[5.1]
  def change
    add_column :traits, :group, :integer
  end
end
