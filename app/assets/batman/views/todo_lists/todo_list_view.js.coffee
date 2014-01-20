class BatmanTodo.TodoListView extends Batman.View
  ready: ->
    @set 'addingTodo', false
    @resetNewTodo()

  viewDidAppear: ->
    # Your node is in the DOM and ready to accept instructions (aka jQuery)

  showTodoForm: (node, event, view) ->
    event.stopImmediatePropagation()
    event.preventDefault()

    @set 'addingTodo', true
    $(view.node).find('.new-todo-field').focus()

  hideTodoForm: (node, event, view) ->
    @set 'addingTodo', false
    @resetNewTodo()

    event.preventDefault()

  addTodo: (node, event, view) ->
    currentNewTodo = @get('newTodo')

    currentNewTodo.save()
    @get('todolist.todos').add(currentNewTodo)

    @resetNewTodo()

  editTodo: (node, event, view) ->
    todo = view.get('todo')
    view.subviews.add new BatmanTodo.TodosEditPopoverView(node, todo)

  resetNewTodo: ->
    @set 'newTodo', new BatmanTodo.Todo(todo_list_id: @get('todolist.id'))

