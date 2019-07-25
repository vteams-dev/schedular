json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.start event.start_time
  json.end event.end_time
  json.end event.repeat
  json.end event.repeat_value
  json.end event.repeat_type

end