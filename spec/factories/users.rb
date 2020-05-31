# frozen_string_literal: true

FactoryBot.define do
  pass = Faker::Internet.password(min_length: 6)
  factory :user do
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    email                 { Faker::Internet.email }
    password              { pass }
    password_confirmation { pass }
    site_title            { Faker::Internet.username(specifier: 'Nancy Johnson', separators: %w[. _ -]) }
    site_address          { Faker::Internet.username }
  end
end
