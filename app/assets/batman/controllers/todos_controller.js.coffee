class BatmanTodo.TodosController extends BatmanTodo.ApplicationController
  routingKey: 'todos'

  new: (params) ->
    @set 'todo', new BatmanTodo.Todo({todo_list_id: params.todoListId})

  create: (params) ->
    @todo.save (error, todo) =>
      if error
        throw error unless error instanceof Batman.ErrorsSet
      else
        @redirect "/todo_lists"