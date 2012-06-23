define [
  'jquery'
  'backbone'
  'bootstrap'
  'templates/sessions/login_bar'
  'i18n'
], ($, Backbone, App) ->

  class App.Views.Sessions.LoginBar extends Backbone.View
    template: JST["templates/sessions/login_bar"]

    initialize: ->
      @model.on('change', @render, this)

    render: ->
      return unless @model?
      $(@el).html(@template(@model.toJSON()))
      return this
