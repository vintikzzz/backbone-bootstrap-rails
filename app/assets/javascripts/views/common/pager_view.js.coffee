define [
  'jquery'
  'backbone'
  'bootstrap'
  'templates/common/pager'
], ($, Backbone, App) ->

  class App.Views.Common.PagerView extends Backbone.View
    template: JST["templates/common/pager"]

    initialize: ->
      @collection.on('add', @render, this)
      @collection.on('remove', @render, this)

    render: ->
      $(@el).html(@template({pageInfo: @collection.toJSON().pageInfo, urlPrefix: @options.urlPrefix}))

      return this
