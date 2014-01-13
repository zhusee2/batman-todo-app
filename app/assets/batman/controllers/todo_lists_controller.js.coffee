class BatmanTodo.TodoListsController extends BatmanTodo.ApplicationController
  routingKey: 'todo_lists'

  index: (params) ->
    @set 'todolists', BatmanTodo.TodoList.get('all')

  show: (params) ->

  edit: (params) ->

  new: (params) ->
    @set 'todolist', new BatmanTodo.TodoList()

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

