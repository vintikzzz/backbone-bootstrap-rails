define [
  'jquery'
  'backbone'
  'bootstrap'
  'helpers/alert_queue'
  'views/common/alert_message_view'
], ($, Backbone, App, AlertQueue, AlertMessageView) ->

  class App.Views.Common.AlertView extends Backbone.View
    addErrorAlert: (message) ->
      @addAlertMessage('error', message)

    addSuccessAlert: (message) ->
      @addAlertMessage('success', message)

    addInfoAlert: (message) ->
      @addAlertMessage('info', message)

    addAlertMessage: (type, message) ->
      AlertQueue.add({type: type, message: message})

    renderAlerts: ->
      alert = @$el.find('#alert')
      if alert.length == 0
        alert = $('<div id="alert" />')
        @$el.prepend(alert)
      alert.html('')

      addMessage = (m) ->
        view = new AlertMessageView({model: m})
        alert.append(view.render().el)

      addMessage m for m in AlertQueue.models

    close: ->
      do AlertQueue.clear
