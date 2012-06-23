define [
  'jquery'
  'backbone'
  'bootstrap'
], ($, Backbone, App) ->
  class AlertQueue extends Backbone.Collection

    add: (obj) ->
      obj['shown'] = false
      super obj

    clear: ->
      m.destroy() for m in @models when m? and m.get('shown') is true

  App.Helpers.AlertQueue = new AlertQueue()
