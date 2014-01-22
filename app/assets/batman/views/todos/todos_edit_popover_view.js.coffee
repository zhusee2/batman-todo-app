class BatmanTodo.TodosEditPopoverView extends BatmanTodo.BootstrapPopoverView
  constructor: (popoverHook, todo, options = {}) ->
    defaultOptions = {
      popoverOptions: {
        title: 'Edit'
      }
    }
    options = $.extend(defaultOptions, options)
    super(popoverHook, options)

    @set('todo', todo)
    @set('source', "todos/edit_popover")
    @set('groupIdentifier', 'todos-edit-popover')
    @set('instanceIdentifier', "todos-edit-popover-#{Date.now()}")

    @set('priorityList', BatmanTodo.Todo.priorities)

  updateTodo: (node, event, view) ->
    @todo.save()
