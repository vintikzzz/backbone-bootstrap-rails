define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/alert_view'
  'templates/common/pager'
], ($, Backbone, App, AlertView) ->

  class App.Views.Common.PagerView extends AlertView
    template: JST["templates/common/pager"]

    initialize: ->
      @collection.on('add', @render, this)
      @collection.on('remove', @render, this)

    render: ->
      super
      $(@el).html(@template({pageInfo: @collection.toJSON().pageInfo, urlPrefix: @options.urlPrefix}))
      return this
