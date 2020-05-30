class AddConstraintToEvents < ActiveRecord::Migration[6.0]
  def change
    change_column_null :events, :title, false, ''
    change_column_null :events, :description, false, ''
    change_column_null :events, :date, false, ''
    change_column_null :events, :address, false, ''
    change_column_null :events, :user_id, false, ''
  end
end
