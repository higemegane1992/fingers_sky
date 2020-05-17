class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :site_title, :string
    add_column :users, :site_address, :string
  end
end
