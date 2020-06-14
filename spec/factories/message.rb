# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    subject { 'Subject' }
    body    { 'Body' }
    event
    user
  end
end
