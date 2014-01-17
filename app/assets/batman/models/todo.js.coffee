class BatmanTodo.Todo extends Batman.Model
  @resourceName: 'todos'
  @storageKey: 'todos'

  @persist Batman.RailsStorage

  @belongsTo 'todo_list'
  # Must add this to specify nested url
  @urlNestsUnder 'todo_list'

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  @encode 'title', 'completed', 'priority', 'due_date'
  @encodeTimestamps()

  @priorities: ['critical', 'high', 'normal', 'low', 'whatever']

