class CreateBetaUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :beta_users do |t|
			t.string "email", default: "", null: false
			t.string "phone"
			t.string "first_name"
			t.string "last_name"
      t.timestamps
    end
  end
end
