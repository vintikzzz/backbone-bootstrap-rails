define ['backbone'], (Backbone) ->
  class PaginatedCollection extends Backbone.Collection
    constructor: (args) ->
      super(this.parse(args))

    initialize: ->
      # _.bindAll this, "parse", "url", "pageInfo", "nextPage", "previousPage"
      @page = 1
      @perPage ||= 10
      this.on('add', (m) ->
        this.fetch()
      this)
      this.on('remove', (m) ->
        if this.length == 0 and @page > 1
          @page++
        this.fetch()
      this)

    fetch: (options) ->
      options ||= {}
      @trigger "fetching"
      self = this
      success = options.success
      options.success = (resp) ->
        self.trigger "fetched"
        success self, resp  if success

      Backbone.Collection::fetch.call this, options

    setPage: (num) ->
      @page = num
      this.fetch()


    parse: (resp) ->
      @page = resp.current_page
      @perPage = resp.per_page
      @total = resp.total_items
      resp.items

    url: ->
      @baseUrl + "?" + $.param(
        page: @page
      )

    pageInfo: ->
      info =
        total: @total
        page: @page
        perPage: @perPage
        pages: Math.ceil(@total / @perPage)
        prev: false
        next: false

      max = Math.min(@total, @page * @perPage)
      max = @total  if @total is @pages * @perPage
      info.range = [ (@page - 1) * @perPage + 1, max ]
      info.prev = @page - 1  if @page > 1
      info.next = @page + 1  if @page < info.pages
      info

    toJSON: ->
      data = {}
      data['items'] = super
      data['pageInfo'] = this.pageInfo()
      data

    nextPage: ->
      return false  unless @pageInfo().next
      @page = @page + 1
      @fetch()

    previousPage: ->
      return false  unless @pageInfo().prev
      @page = @page - 1
      @fetch()
