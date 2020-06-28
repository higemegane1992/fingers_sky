# frozen_string_literal: true

json.events(@events) do |event|
  json.extract! event, :title
  json.url event_url(event)
end
