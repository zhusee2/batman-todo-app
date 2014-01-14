class BatmanTodo.TodoListsController extends BatmanTodo.ApplicationController
  routingKey: 'todo_lists'

  index: (params) ->
    @set 'todolists', BatmanTodo.TodoList.get('all').sortedBy('id', 'desc')

  show: (params) ->

  edit: (params) ->

  new: (params) ->
    @set 'todolist', new BatmanTodo.TodoList()

  create: (params) ->
    @todolist.save (error, todolist) =>
      if error
        throw error unless error instanceof Batman.ErrorsSet
      else
        @redirect "/todo_lists"

  update: (params) ->

  destroy: (params) ->

