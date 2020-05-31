# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title       { 'Event Title' }
    description { 'Event Description' }
    date        { '2020-05-30 09:00:00' }
    address     { 'Event Address' }
    image       { 'image' }
    user
  end
end
