json.events(@events) do |event|
  json.extract! event, :title
  json.url event_url(event)
end
