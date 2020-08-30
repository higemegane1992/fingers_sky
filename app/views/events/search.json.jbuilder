# frozen_string_literal: true

json.events(@events) do |event|
  json.extract! event, :title
  json.path event_path(event)
end
