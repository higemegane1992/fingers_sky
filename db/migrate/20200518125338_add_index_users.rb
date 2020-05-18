class AddIndexUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :last_name, false, ""
    change_column_null :users, :first_name, false, ""
    change_column_null :users, :site_title, false, ""
    change_column_null :users, :site_address, false, ""
    add_index :users, :site_address, unique: true
  end
end
