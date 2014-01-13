class BatmanTodo.TodoListsController extends BatmanTodo.ApplicationController
  routingKey: 'todo_lists'

  index: (params) ->
    @set 'todolists', BatmanTodo.TodoList.get('all')

  show: (params) ->

  edit: (params) ->

  new: (params) ->

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

