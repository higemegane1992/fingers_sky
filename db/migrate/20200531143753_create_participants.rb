# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.references :event, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
