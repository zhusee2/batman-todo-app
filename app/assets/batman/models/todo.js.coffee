class BatmanTodo.Todo extends Batman.Model
  @resourceName: 'todos'
  @storageKey: 'todos'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  @encode 'title', 'completed'
  @encodeTimestamps()

