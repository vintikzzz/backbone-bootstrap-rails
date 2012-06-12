define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/error_view'
  'templates/posts/new'
], ($, Backbone, App) ->

  class App.Views.Posts.NewView extends App.Views.Common.ErrorView
    template: JST["templates/posts/new"]

    events:
      "submit #new-post": "save"

    save: (e) ->
      e.preventDefault()
      e.stopPropagation()

      @model.unset("errors", silent: true)

      @model.save(null,
        success: (post) =>
          @model = post
          window.location.hash = "/posts/#{@model.id}"
          @collection.add(@model, at: 0)

        error: (post, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )

    render: ->
      $(@el).html(@template(@model.toJSON() ))
      this.$("form").backboneLink(@model)
      return this
