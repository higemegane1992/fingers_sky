# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :address, presence: true

  has_many :messages
  has_many :participants
  belongs_to :host, class_name: 'User', foreign_key: :user_id
  has_many :guests, through: :participants, source: :user
end
