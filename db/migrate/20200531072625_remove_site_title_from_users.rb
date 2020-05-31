class RemoveSiteTitleFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :site_title
  end
end
