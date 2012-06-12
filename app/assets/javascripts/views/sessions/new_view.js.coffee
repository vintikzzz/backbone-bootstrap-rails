define [
  'jquery'
  'backbone'
  'bootstrap'
  'models/session'
  'views/common/error_view'
  'templates/sessions/new'
], ($, Backbone, App, Session, ErrorView) ->

  class App.Views.Sessions.NewView extends ErrorView
    template: JST["templates/sessions/new"]

    events:
      "submit #new-session": "save"

    save: (e) ->
      e.preventDefault()
      e.stopPropagation()

      @model.unset("errors", silent: true)

      @model.save(null,
        success: (session) =>
          @options.user.id = session.id
          @options.user.fetch()
          @options.token.fetch()
          @session = new Session(@options.user)
          window.location.hash = "/posts"

        error: (post, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )

    render: ->
      $(@el).html(@template(@model.toJSON() ))

      this.$("form").backboneLink(@model)

      return this
