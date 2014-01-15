class BatmanTodo.TodoListView extends Batman.View
  ready: ->
    @set 'newTodo', new BatmanTodo.Todo(todo_list_id: @get('todolist.id'))

  viewDidAppear: ->
    # Your node is in the DOM and ready to accept instructions (aka jQuery)

  addTodo: (node, event, view) ->
    currentNewTodo = @get('newTodo')

    currentNewTodo.save()
    @get('todolist.todos').add(currentNewTodo)

    @set 'newTodo', new BatmanTodo.Todo(todo_list_id: @get('todolist.id'))

