# frozen_string_literal: true

FactoryBot.define do
  factory :participant do
    event
    user
  end
end
