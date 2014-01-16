class BatmanTodo.TodosEditPopoverView extends Batman.View
  constructor: (popoverHook, todo, options = {})->
    @set('hook', popoverHook)
    @set('todo', todo)
    @set('source', "todos/edit_popover")
    @set('groupIdentifier', 'bt-popover')
    @set('instanceIdentifier', "popover-#{Date.now()}")

    super(options)

  ready: ->
    $(document).on "#{@groupIdentifier}-show.#{@instanceIdentifier}", (event, instance) =>
      @notifiedPopoverShow(event, instance)

  viewDidAppear: ->
    # Your node is in the DOM and ready to accept instructions (aka jQuery)
    $(@hook).popover({
      title: 'Popover'
      content: @node
      html: true
      trigger: 'manual'
      placement: 'right'
      container: 'body'
    })
    @show()

  show: ->
    $(@hook).popover('show')
    console.log "#{@groupIdentifier}-show.#{@instanceIdentifier}"
    $(document).trigger("#{@groupIdentifier}-show", this)
    @fire('show')

  hide: ->
    $(@hook).popover('hide')
    $(document).trigger("#{@groupIdentifier}-hide", this)
    @fire('hide')

  destroy: ->
    $(@hook).popover('destroy')
    $(document).off(".#{@instanceIdentifier}")
    @fire('destroy')

  hideAndDestroy: ->
    @hide()
    setTimeout =>
      @destroy()
    , 1000

  notifiedPopoverShow: (jqEvent, instance) ->
    @hideAndDestroy() if instance isnt this

  # buttonWasClicked: (node, event, view) ->
    # You can put all of your event handlers in this view file. You can access
    # data by using `view.lookupKeypath('someData')` or `@controller`.
