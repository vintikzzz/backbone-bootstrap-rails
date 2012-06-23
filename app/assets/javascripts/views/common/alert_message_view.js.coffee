define [
  'jquery'
  'backbone'
  'bootstrap'
  'templates/common/alert_message'
], ($, Backbone, App) ->

  class App.Views.Common.AlertMessageView extends Backbone.View
    template: JST["templates/common/alert_message"]

    events: ->
      'click .close': 'destroy'

    render: ->
      $(@el).html(@template(@model.toJSON()))
      @model.set('shown', true)
      return this

    destroy: ->
      @model.destroy()
      @remove()
