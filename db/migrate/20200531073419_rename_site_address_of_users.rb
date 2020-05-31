# frozen_string_literal: true

class RenameSiteAddressOfUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :site_address, :user_name
  end
end
