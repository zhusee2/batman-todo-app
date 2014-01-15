class BatmanTodo.TodosEditPopoverView extends Batman.View
  constructor: (popoverHook, todo, options = {})->
    @set('hook', popoverHook)
    @set('todo', todo)
    @set('source', "todos/edit_popover")

    super(options)

  viewDidAppear: ->
    # Your node is in the DOM and ready to accept instructions (aka jQuery)
    $(@hook).popover({
      title: 'Popover'
      content: @node
      html: true
      trigger: 'manual'
      placement: 'right'
      container: 'body'
    }).popover('show')

  # buttonWasClicked: (node, event, view) ->
    # You can put all of your event handlers in this view file. You can access
    # data by using `view.lookupKeypath('someData')` or `@controller`.
