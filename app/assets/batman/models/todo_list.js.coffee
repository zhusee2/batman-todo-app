class BatmanTodo.TodoList extends Batman.Model
  @resourceName: 'todo_lists'
  @storageKey: 'todo_lists'

  @persist Batman.RailsStorage

  @hasMany 'todos'

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  @encode 'title', 'completed'
  @encodeTimestamps()

