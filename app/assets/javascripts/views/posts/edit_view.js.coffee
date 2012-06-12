define [
  'jquery'
  'backbone'
  'bootstrap'
  'views/common/error_view'
  'templates/posts/edit'
], ($, Backbone, App) ->

  class App.Views.Posts.EditView extends App.Views.Common.ErrorView
    template : JST["templates/posts/edit"]

    events :
      "submit #edit-post" : "update"

    update : (e) ->
      e.preventDefault()
      e.stopPropagation()

      @model.unset("errors", silent: true)

      @model.save(null,
        success : (post) =>
          @model = post
          window.location.hash = "/posts/#{@model.id}"
        error: (post, jqXHR) =>
          @model.set({errors: $.parseJSON(jqXHR.responseText)})
      )

    render : ->
      $(@el).html(@template(@model.toJSON() ))
      this.$("form").backboneLink(@model)
      return this
