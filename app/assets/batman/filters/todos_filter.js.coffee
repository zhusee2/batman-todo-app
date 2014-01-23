Batman.Filters.priorityLabel = (value) ->
  labelClass = "label-info" if value isnt "normal"

  labelClass = switch value
    when "critical" then "label-important"
    when "high" then "label-warning"
    when "low" then "label-success"
    when "whatever" then "label-inverse"

  return "label #{labelClass}"