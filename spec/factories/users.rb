FactoryBot.define do
  factory :user do
    last_name             {"Fingers"}
    first_name            {"Sky"}
    email                 {"test@fingers_sky.com"}
    password              {"password"}
    password_confirmation {"password"}
    site_title            {"Fingers Sky"}
    site_address          {"fingers-sky"}
  end
end
