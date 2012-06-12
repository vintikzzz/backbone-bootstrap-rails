define [
  'jquery'
  'backbone'
  'bootstrap'
  'templates/common/confirm'
], ($, Backbone, App) ->

  class App.Views.Common.ConfirmView extends Backbone.View
    template: JST["templates/common/confirm"]

    events:
      "click .yes":   "accept"
      "click .close": "reject"
      "click .no":    "reject"

    render: ->
      @modal = $(@template())
      $(@el).html(@modal)
      @modal.modal({ backdrop: true }).modal('show')
      return this

    accept: ->
      @modal.modal('hide')
      t = this
      setTimeout( ->
        t.trigger('accept')
      , 500
      )

    reject: ->
      @modal.modal('hide')


