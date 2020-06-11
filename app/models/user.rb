# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :user_name, presence: true, uniqueness: true

  has_many :host_events, class_name: 'Event', foreign_key: :user_id
  has_many :participants
  has_many :guest_events, through: :participants, source: :event
  has_many :sended_messages, class_name: 'Message', foreign_key: :user_id
  has_many :received_messages, through: :events, source: :message
end
