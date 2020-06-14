# frozen_string_literal: true

class Message < ApplicationRecord
  validates :subject, presence: true
  validates :body, presence: true

  belongs_to :event
  belongs_to :user
end
