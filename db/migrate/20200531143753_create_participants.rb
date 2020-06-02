# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.references :event, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end

    add_index :participants, [:event_id, :user_id], unique: true
  end
end
