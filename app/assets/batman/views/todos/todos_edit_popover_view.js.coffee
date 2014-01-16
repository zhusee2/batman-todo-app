class BatmanTodo.TodosEditPopoverView extends Batman.View
  constructor: (popoverHook, todo, options = {})->
    @set('hook', popoverHook)
    @set('todo', todo)
    @set('source', "todos/edit_popover")
    @set('groupIdentifier', 'bt-popover')
    @set('instanceIdentifier', "popover-#{Date.now()}")

    super(options)

  bindEvents: ->
    $(@popoverContainer).on "click", (event) ->
      event.stopPropagation()

    $(document).on "#{@groupIdentifier}-show.#{@instanceIdentifier}", (event, instance) =>
      @notifiedPopoverShow(event, instance)

    $(document).on "click.#{@instanceIdentifier}", (event) =>
      @notifiedDocumentClick(event)

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
    @bindEvents()

  show: ->
    $(@hook).popover('show')
    $(document).trigger("#{@groupIdentifier}-show", this)
    @fire('show')
    @set('popoverContainer', $(@node).closest('.popover'))

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

  notifiedDocumentClick: (jqEvent) ->
    @hideAndDestroy()

  # buttonWasClicked: (node, event, view) ->
    # You can put all of your event handlers in this view file. You can access
    # data by using `view.lookupKeypath('someData')` or `@controller`.
