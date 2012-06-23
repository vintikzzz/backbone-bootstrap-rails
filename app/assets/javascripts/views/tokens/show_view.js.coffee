define [
  'jquery'
  'backbone'
  'bootstrap'
], ($, Backbone, App) ->
  class App.Views.Tokens.ShowView extends Backbone.View
    initialize: ->
      @model.set('token', $('meta[name="csrf-token"]').attr('content'))
      @model.on('change', @render, this)

    render: ->
      $('meta[name="csrf-token"]').attr('content', @model.get('token'))
      return this
