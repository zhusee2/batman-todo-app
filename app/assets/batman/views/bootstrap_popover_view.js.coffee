class BatmanTodo.BootstrapPopoverView extends Batman.View
  constructor: (popoverHook, options = {}) ->
    super

    popoverDefaultOption = {
      title: 'Popover'
      html: true
      trigger: 'manual'
      placement: 'right'
      container: 'body'
    }
    popoverOptions = $.extend({}, popoverDefaultOption, options.popoverOptions)

    @set('popoverOptions', popoverOptions)
    @set('groupIdentifier', 'bs-popover')
    @set('instanceIdentifier', "bs-popover-#{Date.now()}")

    @set('hook', popoverHook)

  bindEvents: ->
    $(@popoverContainer).on "click", (event) ->
      event.stopPropagation()

    $(document).on "#{@groupIdentifier}-show.#{@instanceIdentifier}", (event, instance) =>
      @notifiedPopoverShow(event, instance)

    $(document).on "click.#{@instanceIdentifier}", (event) =>
      @notifiedDocumentClick(event)

  viewDidAppear: ->
    # Your node is in the DOM and ready to accept instructions (aka jQuery)
    $(@hook).popover $.extend(@popoverOptions, {content: @node})
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
