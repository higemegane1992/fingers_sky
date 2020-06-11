# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :address, presence: true

  belongs_to :user
  has_many :participants
  has_many :guests, through: :participants, source: :user
  has_many :messages
end
